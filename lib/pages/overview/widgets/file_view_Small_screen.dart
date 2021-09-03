import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/file_info_Card_samll.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/info_card_small.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

class FileViewSmallScreen extends StatelessWidget {
  
  final List<String> directoryName;
  final List<String> fileName;
  const FileViewSmallScreen({ Key key, this.directoryName, this.fileName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
     return  Container(
       height: 460,
       width: double.infinity,
       child: Column(
         children: [
           InfoCardSmallFile(
                         title: "Algorithmns",
                         subtitle: "298 Courses Present",
                         onTap: () {},
                         date: "29-2-2019",
                       ),
                       SizedBox(
                         height: _width / 64,
                       ),
                      InfoCardSmallFile(
                         title: "Computer Networks",
                         subtitle: "298 Courses Present",
                         onTap: () {},
                         date: "29-2-2019",
                       ),
                      SizedBox(
                         height: _width / 64,
                       ),
                       InfoCardSmallFile(
                         title: "Data Structures",
                         subtitle: "298 Courses Present",
                         onTap: () {},
                         date: "29-2-2019",
                       ),
                       SizedBox(
                         height: _width / 64,
                       ),
                       InfoCardSmallFile(
                         title: "Database",
                         subtitle: "298 Courses Present",
                         onTap: () {},
                         date: "29-2-2019",
                       ),
                   
         ],
       ),
     );
  }
}