import 'package:ecommercefirebase/features/comments/presentation/widgets/commment_in_all_comment.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/row_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyAllComment extends StatelessWidget {
  const BodyAllComment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: RowUser()),
        SliverToBoxAdapter(child: SizedBox(height: 30.h ,)),
        SliverToBoxAdapter(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return  Padding(
                padding: const EdgeInsets.only(bottom:  8.0),
                child: CommmentInAllComment(),
              ) ;
            },
          ),
        ),
      ],
    );
  }
}

