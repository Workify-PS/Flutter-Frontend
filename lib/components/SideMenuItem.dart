//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/components/SubTiles.dart';
import 'package:workify/utils/constants.dart';

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
  bool isExpaned = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpaned = !isExpaned;
          });
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
              bottom: BorderSide(color: Color(0xFFDFE2EF)),
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
                      color:
                          (isHover || isExpaned) ? kPrimaryColor : kTextColor),
                  SizedBox(
                    width: kDefaultPadding * 0.75,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color:
                              (isHover || isExpaned) ? kTextColor : kGrayColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Spacer(),
                  if (isHover && !isExpaned)
                    SvgPicture.asset("assets/icons/Angle right.svg", width: 16),
                  if (isExpaned)
                    SvgPicture.asset("assets/icons/Angle down.svg", width: 16),
                ],
              ),
              if (isExpaned) SubTilesList()
            ],
          ),
        ),
      ),
    );
  }
}
