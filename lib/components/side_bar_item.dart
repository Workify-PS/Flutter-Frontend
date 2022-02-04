import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class SideMenuItem extends StatelessWidget {
  final bool isCollapsed;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool hover;
  const SideMenuItem(
      {Key?key,
      required this.isCollapsed,
      required this.hover,
      required this.icon,
      required this.onPressed,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFDFE2EF)),
        ),
      ),
      child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          dense: true,
          leading: isCollapsed
              ? null
              : Icon(
                  icon,
                  size: 24,
                ),
          title: isCollapsed
              ? Icon(
                  icon,
                  size: 24,
                )
              : Text(
                  title,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: (hover) ? kTextColor : kGrayColor,
                      ),
                ),
          onTap: onPressed),
    );
  }
}
