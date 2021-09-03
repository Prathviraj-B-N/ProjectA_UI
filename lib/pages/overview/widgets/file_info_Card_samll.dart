
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

class InfoCardSmallFile extends StatelessWidget {
  final String title;
  final String date;
  final String subtitle;
  final String numberOfContents;
  final Function onTap;

  const InfoCardSmallFile({Key key,@required this.title,@required this.date,@required this.onTap, this.subtitle, this.numberOfContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: lightGrey, width: .7),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: title,color: Colors.black,size: 25,),
                  Icon(Icons.arrow_right,color: Colors.black,)
              ],),
              SizedBox(height: 1,),
              Row(  
                children: [
                  CustomText(text: subtitle,color: Colors.grey[600],size: 14,),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
