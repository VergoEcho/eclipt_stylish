import 'package:eclipt_stylish/core/core.dart';
import 'package:eclipt_stylish/features/auth/presentation/providers/providers.dart';
import 'package:eclipt_stylish/features/auth/presentation/widgets/email_field.dart';
import 'package:eclipt_stylish/features/auth/presentation/widgets/password_field.dart';
import 'package:eclipt_stylish/features/auth/presentation/widgets/repeat_password_field.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isLoading = useState<Future<void>?>(null);

    final snapshot = useFuture(isLoading.value);
    final snapshotLoading = snapshot.connectionState == ConnectionState.waiting;
    final isErrored = snapshot.hasError && !snapshotLoading;
    final isDone = snapshot.connectionState == ConnectionState.done;
    final isSuccess = isDone && !snapshot.hasError;

    useEffect(() {
      if (isSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.goNamed(Routes.setUpAccount.name);
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
                // Title
                SizedBox(
                  width: 200,
                  child: Text(
                    context.strings.createAnAccountTitle,
                    style: context.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),

                EmailField(controller: emailController),
                PasswordField(controller: passwordController),
                RepeatPasswordField(
                  controller: confirmPasswordController,
                  passwordController: passwordController,
                ),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: snapshotLoading
                        ? null
                        : () {
                            if (!(formKey.currentState?.validate() ?? false)) return;

                            isLoading.value = ref.read(authControllerProvider.notifier).signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            );
                          },
                    child: snapshotLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(context.strings.createAccount),
                  ),
                ),

                // Login Link
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        context.strings.iAlreadyHaveAnAccount,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed(Routes.login.name),
                        child: Text(
                          context.strings.login,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.primary,
                          ).link(context),
                        ),
                      ),
                    ],
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
