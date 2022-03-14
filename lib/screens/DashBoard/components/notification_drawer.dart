import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({Key? key}) : super(key: key);

  get bannerHeight => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: bannerHeight,
                  margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding/1.5),
                        child: Icon(
                          Icons.notifications_on_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        "Notifications",
                        style: Theme.of(context).primaryTextTheme.headline5,
                      ),
                    ],
                  )),
                   SizedBox(height: kDefaultPadding),
                   
            ],
          ),
        ),
      ),
    );
  }
}
