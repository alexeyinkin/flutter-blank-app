import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/my_theme_extension.dart';
import '../../theme/theme.dart';
import '../../widgets/my_scaffold.dart';
import 'state.dart';

const _mockText = 'Search.\n\n'
    '© Alexey Inkin, 2023';

class SearchScreen extends StatelessWidget {
  final SearchNotifier notifier;

  const SearchScreen(this.notifier);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>();

    return MyScaffold(
      maxWidth: MySizes.maxPageWidth,
      scrolls: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Search",
            style: ext?.h2,
            textAlign: TextAlign.center,
          ),
          const MySpacing(),
          const Flexible(
            child: Text(
              _mockText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
