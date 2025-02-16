import 'package:ecommercefirebase/features/comments/presentation/widgets/row_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_comments.dart';

class BodyAllComment extends StatelessWidget {
  const BodyAllComment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: RowUser()),
        SliverToBoxAdapter(child: SizedBox(height: 30.h ,)),
        SliverToBoxAdapter(
          child: ListComments(),
        ),
      ],
    );
  }
}

