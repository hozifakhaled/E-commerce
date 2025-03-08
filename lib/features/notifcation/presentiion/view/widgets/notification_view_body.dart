import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: maincolor2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05,
          //  vertical: context.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.width * 0.05),
              Text(
                'notifications'.toUpperCase(),
                style: Textstyles.text20.copyWith(fontWeight: FontWeight.bold,

                  //fontSize: context.width * 0.06,
                  //color: Colors.white,
                ),
              ),
              SizedBox(height: context.height * 0.01),
              BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  if (state is NotificationsLoaded) {
                    if (state.notifications.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: context.height * 0.2),
                            const Text(
                              'You have no notifications yet',
                              style: TextStyle(
                             //   color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(
                          vertical: context.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          trailing: Text(
                            "${state.notifications[index].timestamp.hour}:${state.notifications[index].timestamp.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(),
                          ),
                          title: Text(
                            state.notifications[index].title,
                            style: Textstyles.text12),
                        
                          subtitle: Text(
                            state.notifications[index].body,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          leading: Icon(
                           Icons.notification_important_outlined ,
                           size: context.width * 0.1,
                            color:maincolor,
                          ),
                        ),
                      ),
                    );
                  } else if (state is NotificationsError) {return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}