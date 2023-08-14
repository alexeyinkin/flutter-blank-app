import 'package:app_state/app_state.dart';
import 'package:flutter/foundation.dart';

import 'screen.dart';
import 'state.dart';

class SearchPage extends StatefulMaterialPage<void, SearchNotifier> {
  static const classFactoryKey = 'Search';

  SearchPage()
      : super(
          key: const ValueKey(classFactoryKey),
          factoryKey: classFactoryKey,
          state: SearchNotifier(),
          createScreen: SearchScreen.new,
        );

  // ignore: avoid_unused_constructor_parameters
  factory SearchPage.fromState(Map<String, dynamic> state) => SearchPage();
}
