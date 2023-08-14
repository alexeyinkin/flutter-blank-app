import 'package:flutter/widgets.dart';

class ClickableWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const ClickableWidget({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DisabledSelectionContainer(
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: child,
        ),
      ),
    );
  }
}

class DisabledSelectionContainer extends StatelessWidget {
  const DisabledSelectionContainer({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(child: child);
  }
}
