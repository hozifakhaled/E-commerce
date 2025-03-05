import 'dart:io';

import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/features/profile/presentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProfileInProfile extends StatelessWidget {
  const ImageProfileInProfile({
    super.key,
    required this.profileEntitiey,
  });
  final ProfileEntitiey profileEntitiey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          SizedBox(
            width: 90.h,
            height: 90.h,
          ),
          // صورة مربعة بزوايا مستديرة صغيرة
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                width: 85.h,
                height: 85.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: CacheHelper().getData(key: 'image') == ''
                    ? Image.asset(
                        Assets.imagesTrangs,
                        fit: BoxFit.contain,
                      )
                    : Image.file(File(CacheHelper().getData(key: 'image')))),
          ),
          // أيقونة القلم في الزاوية اليمنى السفلية
          Positioned(
            bottom: -0,
            right: -0,
            child: InkWell(
              onTap: () {
                bottmSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    color: maincolor2,
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
