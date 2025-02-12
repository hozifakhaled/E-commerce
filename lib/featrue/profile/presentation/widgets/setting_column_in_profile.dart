import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/featrue/profile/presentation/widgets/row_icon_and_text_in_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingColumnInProfile extends StatelessWidget {
  const SettingColumnInProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowTextAndIconInSetting(
              icon1: Icon(Icons.light_mode_outlined),
              text: 'Dark Mode',
              icon2: Icon(Icons.dark_mode_outlined),
            ),
            RowTextAndIconInSetting(
              icon1: Icon(Icons.add_comment_outlined),
              text: 'Add Comment',
              icon2: Icon(Icons.arrow_forward_ios),
            ),
            RowTextAndIconInSetting(
              icon1: Icon(Icons.comment_outlined),
              text: 'All Comments',
              icon2: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
