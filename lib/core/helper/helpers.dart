import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Helpers {
  AwesomeDialog alertDone(BuildContext context,String title,String desc,Function()? btnCancelOnPress,Function()? btnOkOnPress,DialogType dialogType) {

    return AwesomeDialog(
      context: context,
      dialogType:
          dialogType, // أنواع مختلفة مثل warning، success، error
      animType: AnimType.scale, // نوع الحركة
      title: title,
      desc: desc,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    );
  }
 
}
