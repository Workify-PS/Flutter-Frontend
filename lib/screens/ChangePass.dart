import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

class ChangePass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: const EdgeInsets.only(right: 1400),
              child: Text('ACCOUNT')),
          backgroundColor: Colors.lightBlue[800],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [Body()],
          ),
        ));
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.5,
                    ),
                    Text(
                      'Change Password:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Choose a unique Password to protect your Account',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 238,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            labelText: 'Current Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 5.8),
                    SizedBox(
                      height: 40,
                      width: 238,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            labelText: 'New Password  ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 5.8),
                    SizedBox(
                      height: 40,
                      width: 238,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            labelText: 'Confirm Password  ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        'Password ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '- must bew atleast 6 characters long,',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '- must contain lower case alphabets(a-z),',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '- can contain upper case alphabets(A-Z),',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "- must contain special characters(-/@#!*\$%^&,'_+={}[]).",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(color: Colors.black12),
                              backgroundColor: Colors.tealAccent[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {},
                          icon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              color: Colors.black87,
                            ),
                          ),
                          label: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.5),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(color: Colors.black12),
                              backgroundColor: Colors.tealAccent[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {},
                          icon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.delete_outline_sharp,
                                color: Colors.black87),
                          ),
                          label: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
