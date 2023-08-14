import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import '../theme/my_theme_extension.dart';
import '../theme/theme.dart';
// import 'environment.dart';
import 'layout/constrained_width.dart';
import 'loading/small_circular_progress_indicator.dart';
import 'logo.dart';
import 'menu/top_menu.dart';
// import 'my_padding.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    required this.body,
    required this.scrolls,
    this.maxWidth,
    this.padding = true,
  });

  const MyScaffold.loading({
    required this.scrolls,
    this.maxWidth,
    this.padding = true,
  }) : body = const Center(
          child: SmallCircularProgressIndicator(),
        );

  final Widget body;
  final double? maxWidth;
  final bool padding;
  final bool scrolls;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = _isMobileScreen(screenWidth);

    Widget child = body;

    if (maxWidth != null) {
      child = ConstrainedWidthWidget(
        maxWidth: maxWidth,
        child: child,
      );
    }

    if (padding) {
      child = MyPadding(child: child);
    }

    if (scrolls) {
      child = SingleChildScrollView(child: child);
    }

    return Stack(
      children: [
        Scaffold(
          body: ColoredBox(
            color: MyColors.colorBlack,
            child: SafeArea(
              child: ColoredBox(
                color: MyColors.colorWhite,
                child: Column(
                  children: [
                    if (isMobile)
                      const _NarrowHeader()
                    else
                      const _WideHeader(),
                    const HorizontalBlackLine(),
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // if (EnvironmentBanner.isShowing) const EnvironmentBanner(),
      ],
    );
  }

  bool _isMobileScreen(double screenWidth) {
    return screenWidth < MySizes.minDesktopWidth;
  }
}

class _NarrowHeader extends StatelessWidget {
  const _NarrowHeader();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      alignment: Alignment.center,
      color: ext.headerColor,
      width: double.infinity,
      child: const LogoWidget(),
    );
  }
}

class _WideHeader extends StatelessWidget {
  const _WideHeader();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      alignment: Alignment.center,
      color: ext.headerColor,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Senior.dev",
            style: ext.h1,
          ),
          const SizedBox(
            width: 100,
          ),
          const TopMenuWidget(),
        ],
      ),
    );
  }
}
