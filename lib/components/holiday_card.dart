import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              padding: const EdgeInsets.only(
                  top: kDefaultPadding,
                  right: kDefaultPadding,
                  left: kDefaultPadding),
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
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding * 2,
                                    vertical: kDefaultPadding * 1.2),
                                child: SizedBox(
                                  height: 36,
                                  width: 36,
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
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: kDefaultPadding, right: 10),
                                    child: Text(
                                      items[index].holidayName.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 18, right: 2),
                                    child: Text(
                                      items[index].date.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  )
                                ],
                              ))
                            ],
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
