import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/assets.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/theme.dart';
import 'package:localize_and_translate/localize_and_translate.dart' as ok;
class SideMenuItem extends StatefulWidget {
  // final bool isHover;
  // final bool isSelected;
  //final SubItemList subItems;
  final IconData icon;
  final String title;
  final Widget? subTilesWidget;

  const SideMenuItem(
      {Key? key, required this.icon, required this.title, this.subTilesWidget})
      : super(key: key);

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool isHover = false;
  // bool isSettingsExpanded = false;
  // bool isProfileExpanded = false;
  bool isExpanded = false;
  late bool isExpandable;
  @override
  void initState() {
    isExpandable = widget.subTilesWidget != null;
    super.initState();
  }

  final HomePageController _homePageController = Get.find<HomePageController>();
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
          if (isExpandable) {
            setState(() {
              isExpanded = !isExpanded;
            });
          } else {
            if (Responsivescreen.isMobile(context)) {
              Navigator.pop(context);
            }
            _homePageController.gotoPage(
              "/" + widget.title.toLowerCase(),
              context,
            );
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
                      color: (isHover || isExpanded) ? hoverColor : null),
                  SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  Text(
                   ok.translator.translate(widget.title),
                    style: Theme.of(context).textTheme.button!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Spacer(),
                  if (isHover && !isExpanded)
                    SvgPicture.asset(
                      Assets.angleRight,
                      width: 16,
                      color: accentColor,
                    ),
                  if (isExpanded)
                    SvgPicture.asset(
                      Assets.angleDown,
                      width: 16,
                      color: accentColor,
                    ),
                ],
              ),
              if (isExpanded && widget.subTilesWidget != null)
                widget.subTilesWidget!
            ],
          ),
        ),
      ),
    );
  }
}
