import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/features/auth/presentation/providers/providers.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.images.home.background.path, fit: BoxFit.cover),
          SafeArea(
            bottom: false,
            child: userAsync.when(
              data: (user) {
                if (user == null) {
                  return Center(
                    child: Text(
                      context.strings.unknownError,
                      style: context.textTheme.bodyLarge,
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                        child: Column(
                          spacing: 10,
                          children: [
                            Text(
                              context.strings.homeHeader,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.onInverseSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              context.strings.youAreSignedAs(user.email),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colors.onInverseSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              context.strings.yourTextIs(user.displayText ?? ''),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colors.onInverseSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 32),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              stops: [
                                0.0,
                                0.25
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              context.colors.onSurface.withValues(alpha: .63),
                            ])
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () async => await ref
                                    .read(authControllerProvider.notifier)
                                    .signOut(),
                                child: Text(context.strings.logout),
                              ),
                            ],
                          ),
                      ),
                    )
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text(
                  context.strings.unknownError,
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
