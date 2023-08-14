import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../../router/tab_enum.dart';
import 'page.dart';

class SearchPath extends PagePath {
  static const _location = '/';

  const SearchPath() : super(key: SearchPage.classFactoryKey);

  @override
  String get location => _location;

  static SearchPath? tryParse(RouteInformation ri) {
    final uri = Uri.parse(ri.location ?? '');
    if (uri.path != _location) return null;

    return const SearchPath();
  }

  @override
  String get defaultStackKey => TabEnum.search.name;
}
