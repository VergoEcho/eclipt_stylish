import 'package:eclipt_stylish/core/assets/assets.gen.dart';
import 'package:eclipt_stylish/core/core.dart';
import 'package:eclipt_stylish/features/onboarding/models/onboarding_page_data.dart';
import 'package:eclipt_stylish/features/onboarding/presentation/providers/providers.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingControllerProvider.notifier);
    final currentPage = ref.watch(onboardingControllerProvider);

    final pages = [
      OnboardingPageData(
        svgAsset: Assets.images.onboarding.choseProducts,
        title: context.strings.chooseProducts,
        description: context.strings.onboardingDescription,
      ),
      OnboardingPageData(
        svgAsset: Assets.images.onboarding.makePayment,
        title: context.strings.makePayment,
        description: context.strings.onboardingDescription,
      ),
      OnboardingPageData(
        svgAsset: Assets.images.onboarding.getYourOrder,
        title: context.strings.getYourOrder,
        description: context.strings.onboardingDescription,
      ),
    ];

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _OnboardingHeader(
              currentPage: currentPage,
              totalPages: pages.length,
              controller: controller,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: pages[index]);
                },
              ),
            ),
            _OnboardingFooter(
              currentPage: currentPage,
              totalPages: pages.length,
              pageController: controller.pageController,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final OnboardingController controller;

  const _OnboardingHeader({
    required this.currentPage,
    required this.totalPages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: '${currentPage + 1}',
              style: context.textTheme.labelMedium,
              children: [
                TextSpan(
                  text: '/$totalPages',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          CupertinoButton(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            onPressed: () async {
              await controller.skipOnboarding();

              if (!context.mounted) return;
              context.goNamed(Routes.login.name);
            },
            child: Text(
              context.strings.skip,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              data.svgAsset,
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            data.title,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              data.description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final OnboardingController controller;

  const _OnboardingFooter({
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstPage = currentPage == 0;
    final isLastPage = currentPage == totalPages - 1;

    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Button
          Expanded(
            child: isFirstPage
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: CupertinoButton(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      onPressed: controller.previousPage,
                      child: Text(
                        context.strings.prev,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
          ),

          // Page Indicator
          SmoothPageIndicator(
            controller: pageController,
            count: totalPages,
            effect: ExpandingDotsEffect(
              activeDotColor: context.colors.onSurface,
              dotColor: context.colors.outlineVariant,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 4,
              spacing: 10,
            ),
          ),

          // Next / Get Started Button
          Expanded(
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: isLastPage
                    ? () async {
                        await controller.completeOnboarding();

                        if (!context.mounted) return;
                        context.goNamed(Routes.login.name);
                      }
                    : controller.nextPage,
                child: Text(
                  isLastPage
                      ? context.strings.getStarted
                      : context.strings.next,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
