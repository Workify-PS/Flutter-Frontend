import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/constants.dart';

class SubTilesList extends StatefulWidget {
  const SubTilesList({Key? key}) : super(key: key);

  @override
  _SubTilesListState createState() => _SubTilesListState();
}

class _SubTilesListState extends State<SubTilesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(children: List.generate(4, (index) => SubTile())));
  }
}

// ignore: must_be_immutable
class SubTile extends StatelessWidget {
   SubTile({Key? key}) : super(key: key);

  RxBool isSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {},
          onHover: (value) => isSelected.value = value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 1.4,
            ),
            child: Text(
              "Option".toUpperCase(),
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected.value ? kPrimaryColor : kGrayColor,
                  fontSize: 13),
            ),
          ),
        ));
  }
}
