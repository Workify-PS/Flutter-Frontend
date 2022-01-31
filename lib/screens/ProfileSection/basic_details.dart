import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';


class BasicDetails extends StatelessWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final double screenWidth = device.size.width;
    // final double screenHeight = device.size.height;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:20,bottom:20,left:150,right: 150),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        // Text(
                        //   ':',
                        //   style: TextStyle(
                        //     fontSize: screenWidth * 0.013,
                        //   ),
                        //   textAlign: TextAlign.center,  
                        // ),
                        Text(
                          'Ajay Kumar Gond',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          'Father Name',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Country of Birth',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Blood Group',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Marital Status',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Email ID',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Nationality',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          'Disability',
                          style: TextStyle(
                            fontSize: screenWidth * 0.017,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                        Text(
                          'Something Baba',
                          style: TextStyle(
                            fontSize: screenWidth * 0.013,
                          ),
                          textAlign: TextAlign.center,  
                        ),
                      ], 
                    ),
                  ),
                ],     
          ),
            ),
        ),
      ),
    );
  }
}
