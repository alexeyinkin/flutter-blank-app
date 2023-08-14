import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';

import 'screen.dart';
import 'state.dart';

class AboutPage extends StatefulMaterialPage<void, AboutNotifier> {
  static const classFactoryKey = 'About';

  AboutPage()
      : super(
          key: const ValueKey(classFactoryKey),
          factoryKey: classFactoryKey,
          state: AboutNotifier(),
          createScreen: AboutScreen.new,
        );

  // ignore: avoid_unused_constructor_parameters
  factory AboutPage.fromState(Map<String, dynamic> state) => AboutPage();
}
