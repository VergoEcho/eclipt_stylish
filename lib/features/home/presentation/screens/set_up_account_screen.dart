import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/core/core.dart';
import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/presentation/providers/providers.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetUpAccountScreen extends HookConsumerWidget {
  const SetUpAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final textController = useTextEditingController();
    final isLoading = useState<Future<void>?>(null);

    final snapshot = useFuture(isLoading.value);
    final snapshotLoading = snapshot.connectionState == ConnectionState.waiting;
    final isErrored = snapshot.hasError && !snapshotLoading;
    final isDone = snapshot.connectionState == ConnectionState.done;
    final isSuccess = isDone && !snapshot.hasError;

    useEffect(() {
      if (isSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Invalidate the provider and let the router handle navigation
          ref.invalidate(currentUserProvider);
        });
      }
      if (isErrored) {
        final error = snapshot.error;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(scaffoldMessengerServiceProvider.notifier).showSnackBar(
            error.toString(),
            type: SnackBarType.error,
          );
        });
      }
      return null;
    }, [isErrored, isSuccess]);

    Future<void> performUpdate() async {
      final user = await ref.read(currentUserProvider.future);

      if (user == null) {
        throw Exception(context.strings.unknownError);
      }

      final displayText = textController.text.trim();

      final repository = ref.read(authRepositoryProvider);
      await repository.updateUserData(
        uid: user.uid,
        displayText: displayText,
      );
    }

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    context.strings.setUpAccount,
                    style: context.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: context.strings.enterAnyText,
                    prefixIcon: SvgPicture.asset(
                      Assets.images.auth.person,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.strings.enterAnyText;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: snapshotLoading
                        ? null
                        : () {
                            if (!(formKey.currentState?.validate() ?? false)) return;

                            isLoading.value = performUpdate();
                          },
                    child: snapshotLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(context.strings.finish),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
