import 'package:flutter/material.dart';

import '../../router/tab_enum.dart';
import '../../util/iterable.dart';
import 'menu_item.dart';
// import 'profile_menu_item_widget.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MenuItemWidget(
          title: "Search",
          value: TabEnum.search,
        ),
        MenuItemWidget(
          title: "About",
          value: TabEnum.about,
        ),
        // const ProfileMenuItemWidget(),
      ].alternateWith(const SizedBox(width: 40)).toList(growable: false),
    );
  }
}
