import 'package:app_state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:keyed_collection_widgets/keyed_collection_widgets.dart';

import '../../constants/sizes.dart';
import '../../router/tab_enum.dart';
import '../../util/iterable.dart';
import '../../widgets/layout/my_bottom_navigation_bar.dart';
import '../../widgets/loading/small_circular_progress_indicator.dart';
// import '../me/tabs/profile_tab_enum.dart';

class HomeScreen extends StatefulWidget {
  final PageStacks pageStacks;

  const HomeScreen({
    required this.pageStacks,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: _focusNode,
      selectionControls: materialTextSelectionControls,
      child: StreamBuilder(
        stream: widget.pageStacks.events,
        builder: (context, snapshot) => _buildOnEvent(),
      ),
    );
  }

  Widget _buildOnEvent() {
    final tab = TabEnum.values.byNameOrNull(widget.pageStacks.currentStackKey);
    final screenWidth = MediaQuery.of(context).size.width;

    if (tab == null) return const SmallCircularProgressIndicator();

    return Scaffold(
      body: KeyedStack<TabEnum>(
        itemKey: tab,
        children: widget.pageStacks.pageStacks.map(
          (tabString, stack) => MapEntry(
            TabEnum.values.byName(tabString),
            PageStackNavigator(key: ValueKey(tabString), stack: stack),
          ),
        ),
      ),
      bottomNavigationBar: _isMobileScreen(screenWidth)
          ? MyBottomNavigationBar(pageStacks: widget.pageStacks)
          : null,
    );
  }

  bool _isMobileScreen(double screenWidth) {
    return screenWidth < MySizes.minDesktopWidth;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
