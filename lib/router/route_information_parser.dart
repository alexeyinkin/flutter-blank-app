import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

import '../pages/about/path.dart';
import '../pages/search/path.dart';

class MyRouteInformationParser extends PageStacksRouteInformationParser {
  @override
  // ignore: avoid_renaming_method_parameters
  Future<PagePath> parsePagePath(RouteInformation ri) async {
    // ignore: unnecessary_null_in_if_null_operators
    return null ??
        AboutPath.tryParse(ri) ??

        // These must be last, or they will trigger on the above cases.
        // TechnologyDisambiguatorPath.tryParse(ri) ??
        // TechnologyPath.tryParse(ri) ??

        // The default page if nothing worked.
        const SearchPath();
  }
}
