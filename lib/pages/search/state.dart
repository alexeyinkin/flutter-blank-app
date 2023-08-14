import 'package:app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

import 'path.dart';

class SearchNotifier extends ChangeNotifier with PageStateMixin<void> {
  @override
  SearchPath get path => const SearchPath();
}
