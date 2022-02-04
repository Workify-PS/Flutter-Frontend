import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttontext;

  const Button({Key? key, required this.buttontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width * 0.25;
    return InkWell(
      onTap: () {},
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade50,
            onPrimary: Colors.black,
            elevation: 8,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            shadowColor: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            )),
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
