import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String buttontext;

  const button({Key? key, required this.buttontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade50,
            onPrimary: Colors.black,
            elevation: 8,
            shadowColor: Colors.grey.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(width: 12),
              Text(buttontext),
            ],
          ),
        ),
      ),
    );
  }
}
