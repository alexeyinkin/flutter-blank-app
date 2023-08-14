import 'package:app_state/app_state.dart';
import 'package:flutter/widgets.dart';

// import '../widgets/toast/toast_listener.dart';

class MyRouterDeleagate extends MaterialPageStacksRouterDelegate {
  MyRouterDeleagate(super.pageStacks, Widget widget) : super(child: widget);

  @override
  Widget build(BuildContext context) {
    return SingleEntryOverlay(
      // child: ToastListenerWidget(
        child: super.build(context),
      // ),
    );
  }
}
