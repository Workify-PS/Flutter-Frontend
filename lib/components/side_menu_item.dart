import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workify/components/settings_sub_tiles.dart';
import 'package:workify/components/sub_tiles.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SideMenuItem extends StatefulWidget {
  // final bool isHover;
  // final bool isSelected;
  //final SubItemList subItems;
  final IconData icon;
  final String title;

  const SideMenuItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool isHover = false;
  bool isSettingsExpanded = false;
  bool isExpaned = false;

  @override
  Widget build(BuildContext context) {
    Color accentColor = MyTheme().isDark(context) ? kDividerColor : kGrayColor;
    Color dividerColor =
        !(MyTheme().isDark(context)) ? kDividerColor : kDividerDarkColor;

    Color hoverColor = widget.title.toLowerCase() == "report"
        ? Colors.redAccent
        : MyTheme().isDark(context)
            ? Colors.lightBlue
            : kPrimaryColor;
    return Padding(
      padding:
          const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
      child: InkWell(
        onTap: () {
          var widgetTitle = widget.title.toLowerCase();
          setState(() {
            // isExpaned = !isExpaned;
            if(widgetTitle == 'settings'){
              print('Settings Expanded : '+isSettingsExpanded.toString());
              isSettingsExpanded = !isSettingsExpanded;
              print('Settings Expanded : '+isSettingsExpanded.toString());
            }
          });
          if(widgetTitle != 'settings'){
            Get.toNamed("/${widget.title.toLowerCase()}");
          }
        },
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Container(
          padding: EdgeInsets.only(bottom: kDefaultPadding * 1.5, right: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: dividerColor),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Icon(widget.icon,
                      color: (isHover || isExpaned) ? hoverColor : null),
                  SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Spacer(),
                  if (isHover && !isExpaned && !isSettingsExpanded)
                    SvgPicture.asset(
                      "assets/icons/Angle right.svg",
                      width: 16,
                      color: accentColor,
                    ),
                  if (isExpaned || isSettingsExpanded)
                    SvgPicture.asset(
                      "assets/icons/Angle down.svg",
                      width: 16,
                      color: accentColor,
                    ),
                ],
              ),
              if (isExpaned)
                SubTilesList()
              else if (isSettingsExpanded)
                SettingsSubTiles()
            ],
          ),
        ),
      ),
    );
  }
}
