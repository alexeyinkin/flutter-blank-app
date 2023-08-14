import 'package:app_state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:keyed_collection_widgets/keyed_collection_widgets.dart';

import '../../router/tab_enum.dart';
// import 'user/current_userpic.dart';
// import 'user/raw_userpic.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    required this.pageStacks,
  });

  final PageStacks pageStacks;

  @override
  Widget build(BuildContext context) {
    final tab = TabEnum.values.byName(pageStacks.currentStackKey!);

    return KeyedBottomNavigationBar<TabEnum>(
      currentItemKey: tab,
      keyOrder: const [TabEnum.search, TabEnum.about],
      onTap: _onTabTap,
      //TODO(morozov): https://github.com/alexeyinkin/flutter-keyed-collection-widgets/issues/1
      items: UnmodifiableTabEnumMap(
        // me: BottomNavigationBarItem(
        //   icon: CurrentUserPicWidget(size: sizeUserPicS),
        //   label: "Me",
        // ),
        search: BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Search",
        ),
        about: BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: "About",
        ),
      ),
    );
  }

  void _onTabTap(TabEnum tab) {
    final key = tab.name;

    if (pageStacks.currentStackKey == key) {
      pageStacks.currentStack?.popUntilBottom();
    } else {
      pageStacks.setCurrentStackKey(key);
    }
  }
}
