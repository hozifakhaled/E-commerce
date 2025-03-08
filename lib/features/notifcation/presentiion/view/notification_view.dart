import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/notifcation/data/model/notification_model.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/cubit/notifications_cubit.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/view/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(Hive.box<NotificationModel>('box'))..loadNotifications(),
      child: Scaffold(
        backgroundColor: maincolor2,
        body: const NotificationViewBody(),
      ),
    );
  }
}
