import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/components/button.dart';
import 'package:workify/models/HolidayModel.dart';
// import 'package:workify/services/holiday_get_service.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class HolidaysCard extends StatefulWidget {
  HolidaysCard({Key? key}) : super(key: key);

  @override
  State<HolidaysCard> createState() => _HolidayCardState();
}

class _HolidayCardState extends State<HolidaysCard> {
  // List _items = [];
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/dummy_data/holiday.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["holidays"];
  //   });
  // }
  // final holidays = HolidayGetService();

  @override
  Widget build(BuildContext context) {
    var cardColor =
        MyTheme().isDark(context) ? kDividerColor : kDividerDarkColor;
    // Color accentColor =
    //     MyTheme().isDark(context) ? kDividerColor : Colors.black87;
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Text("${data.error}");
          } else if (data.hasData) {
            var items = data.data as List<HolidayModel>;

            return Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Scrollbar(
                isAlwaysShown: true,
                showTrackOnHover: true,
                controller: _scrollController,
                child: FadingEdgeScrollView.fromScrollView(
                  gradientFractionOnStart: 0.6,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: items.length,
                    // physics: FixedExtentScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding * 0.8),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 36,
                                  width: 36,
                                  margin: const EdgeInsets.only(
                                      right: kDefaultPadding),
                                  // child: Icon(IconData(int.parse('source',))
                                  // Image(
                                  //     image: NetworkImage(
                                  //         items[index].imagePath.toString(),
                                  //         scale: 0.1),
                                  //     fit: BoxFit.fitHeight
                                  //     // backgroundColor: Colors.transparent,
                                  //     )
                                  child: Image.asset(
                                    items[index].imagePath.toString(),
                                    alignment: Alignment.center,
                                    // scale: 7.5,
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].holidayName.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      items[index].date.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Divider(
                            endIndent: kDefaultPadding,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<HolidayModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/holidays/holiday.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => HolidayModel.fromJson(e)).toList();
  }
}

class WishText extends StatelessWidget {
  const WishText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Wish',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //TextFormField(initialValue: "I am smart")
              content: TextFormField(
                autofocus: true,
                focusNode: focusNode,
                controller: TextEditingController()
                  ..text = 'Wishing you a very ',
                decoration: InputDecoration(
                  labelText: "",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 1.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: PrimaryButton(
                    buttonTextWidget: Text('Send'),
                    onPressed: () {},
                    primaryColor: kPrimaryColor,
                    icon: Icon(CupertinoIcons.arrowtriangle_right),
                  ),
                )
              ],
            ));
    return TextButton.icon(
      icon: Icon(
        CupertinoIcons.arrowshape_turn_up_right,
        size: 18,
      ),
      // onPressed: wishEmailRedirect,
      onPressed: () {
        openDialog();
      },
      label: Text('Wish'),
      style: ElevatedButton.styleFrom().copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return kPrimaryColor;
            }
            return Theme.of(context).textSelectionColor;
          },
        ),
      ),
    );
  }
}
