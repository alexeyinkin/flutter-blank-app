import 'package:app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

import 'path.dart';

class AboutNotifier extends ChangeNotifier with PageStateMixin<void> {
  @override
  AboutPath get path => const AboutPath();
}
