// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/services/change_password_service.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SettingsSubTiles extends StatelessWidget {
  SettingsSubTiles({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  final homePageController = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsSubTile(
              settingsOptions: 'Switch Theme',
              onTap: null,
              trailingWidget: ChangeThemeButton(),
            ),
            SettingsSubTile(
              settingsOptions: 'Change Password',
              // onTap: () => homePageController.gotoPage("/change-password", context),
              onTap: () {
                Get.defaultDialog(
                    navigatorKey: Get.keys[1],
                    radius: 8,
                    backgroundColor: Colors.grey.shade200,
                    barrierDismissible: false,
                    title: 'Change Password',
                    content: ChangePasswordWidget());
              },
            ),
            SettingsSubTile(
              settingsOptions: 'Log Out',
              onTap: () => authController.logOutDialog(),
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class SettingsSubTile extends StatelessWidget {
  VoidCallback? onTap;
  String settingsOptions;
  Widget? trailingWidget;
  SettingsSubTile(
      {Key? key,
      required this.settingsOptions,
      required this.onTap,
      this.trailingWidget})
      : super(key: key);
  RxBool isHovered = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 1.5,
            top: kDefaultPadding / 1.4,
            bottom: trailingWidget != null ? 0 : kDefaultPadding / 1.4,
          ),
          child: InkWell(
            onTap: onTap,
            onHover: (value) => isHovered.value = value,
            child: Row(
              children: [
                Text(
                  settingsOptions,
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: isHovered.value ? kPrimaryColor : kGrayColor,
                      fontSize: 13),
                ),
                Spacer(),
                if (trailingWidget != null) trailingWidget!
              ],
            ),
          ),
        ));
  }
}

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  _ChangeThemeButtonState createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton>
    with CacheManager {
  var _icon;
  late bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    isDarkMode = MyTheme().isDark(context);

    // return true
    //     ?
    return Switch(
      // hoverColor: Colors.transparent,
      // focusColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: MouseCursor.uncontrolled,
      activeColor: kPrimaryColor,
      value: isDarkMode,
      onChanged: (value) {
        setState(() {
          isDarkMode = value;
          if (isDarkMode) {
            Get.changeThemeMode(ThemeMode.dark);
            saveAppSettings(ThemeMode.dark);
          } else {
            Get.changeThemeMode(ThemeMode.light);
            saveAppSettings(ThemeMode.light);
          }
        });
      },
    );
    // : IconButton(
    //     icon: Icon(
    //       _icon,
    //       size: 30,
    //     ),
    //     onPressed: () {
    //       setState(() {
    //         if (_icon == Icons.wb_sunny) {
    //           Get.changeThemeMode(ThemeMode.light);
    //           saveAppSettings(ThemeMode.light);
    //         } else {
    //           Get.changeThemeMode(ThemeMode.dark);
    //           saveAppSettings(ThemeMode.dark);
    //         }
    //       });
    //     },
    //   );
  }
}

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordConfirmPasswordMatched = false;

  @override
  Widget build(BuildContext context) {
    void overridePasswordHandler() {
      var _newPasswordText = _newPasswordController.text;
      if (_newPasswordText.isEmpty) {
        // Will Change later
        print('New PasswordTextField empty');
      } else {
        if (_newPasswordController.text != _confirmPasswordController.text) {
          Get.defaultDialog(
              title: "Passwords don't match",
              middleText:
                  "New and confirm password fields should have same values");
        } else {
          var data = {
            "oldPassword": _currentPasswordController.text,
            "newPassword": _confirmPasswordController.text
          };
          ChangePasswordService.callChangePasswordApi(data, context);
        }
      }
    }

    return Column(
      children: [
        TextFormField(
          focusNode: FocusNode(),
          controller: _currentPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            label: Text('Current password'),
            labelStyle: TextStyle(color: kPrimaryColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          onChanged: (value) {
            setState(() {
              if (value == _confirmPasswordController.text) {
                _passwordConfirmPasswordMatched = true;
              } else {
                _passwordConfirmPasswordMatched = false;
              }
            });
          },
          focusNode: FocusNode(),
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            label: Text('New password'),
            labelStyle: TextStyle(color: kPrimaryColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          onChanged: (value) {
            setState(() {
              if (value == _newPasswordController.text) {
                _passwordConfirmPasswordMatched = true;
              } else {
                _passwordConfirmPasswordMatched = false;
              }
            });
          },
          focusNode: FocusNode(),
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            label: Text('Confirm password'),
            labelStyle: TextStyle(color: kPrimaryColor),
            // errorText: _passwordConfirmPasswordMatched.toString(),
            errorText: "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _confirmPasswordController.text.isNotEmpty
                    ? _passwordConfirmPasswordMatched
                        ? Colors.green
                        : Colors.red
                    : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(id: 1);
                },
                child: Text('Get back'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: overridePasswordHandler,
                child: Text('Change password'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
