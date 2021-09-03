import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/file_view_Small_screen.dart';

class FileView extends StatelessWidget {
  final List<String> directoryName;
  final List<String> fileName;
  const FileView({ Key key,this.directoryName,this.fileName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      if(ResponsiveWidget.isSmallScreen(context)){
          return FileViewSmallScreen();
      }
      else{
        return Container(
          width: double.infinity,
          height: 100,
          color: Colors.black,
        );
      }
  }
}