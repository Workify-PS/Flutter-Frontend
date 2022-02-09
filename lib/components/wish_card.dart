import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:workify/components/button.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/extensions.dart';

class WishCard extends StatefulWidget {
  const WishCard({
    Key? key,
  }) : super(key: key);

  @override
  State<WishCard> createState() => _WishCardState();
}

class _WishCardState extends State<WishCard> {
  String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 32,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            ),
            // Expanded(
            //     child: Text.rich(TextSpan(
            //   text: "Wish",
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.w500,
            //     color: kTextColor,
            //   ),
            // ))),
          ],
        ),
        SizedBox(height: 28),
        RichText(
            text: TextSpan(
              children: [
                WidgetSpan(child: Icon(Icons.calendar_today_rounded, size: 20)),
                TextSpan(text: now, style: TextStyle(fontSize: 20)),
              ]
            ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 1,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: (){}, 
                child: Text(
                  'Birthdays',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color:kTextColor,
                  ),    
                ),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text(
                  'Anniversaries',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color:kTextColor,
                  ),    
                ),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text(
                  'New Joiners',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color:kTextColor,
                  ),    
                ),
              ),
              
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [

        //     // ButtonTheme(
        //     //   minWidth: 100,
        //     //   height: 100,
        //     //   child: Button(
        //     //     buttontext: 'Birthdays',
        //     //   ),
        //     // ),
        //     // ButtonTheme(
        //     //   minWidth: 100,
        //     //   height: 100,
        //     //   child: Button(
        //     //     buttontext: 'Anniversaries',
        //     //   ),
        //     // ),
        //     // Button(buttontext: 'New Joiners'),
        //   ],
        // )
      ],
    );
  }
}
