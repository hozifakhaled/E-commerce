// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/features/notifcation/data/model/notification_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  // NotificationsCubit() : super(NotificationsInitial());
  final Box<NotificationModel> notificationsBox;

  NotificationsCubit(this.notificationsBox) : super(NotificationsInitial()) {
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    try {
      final notifications = notificationsBox.values.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
      emit(NotificationsLoaded(notifications));
    } catch (e, stackTrace) {
      print('Error loading notifications: $e\n$stackTrace');
      emit(NotificationsError('فشل في تحميل الإشعارات'));
    }
  }
  Future<void> addNotificationToList(NotificationModel notification) async {
  try {
    await notificationsBox.put(notification, notification);
    final updatedNotifications = notificationsBox.values.toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    emit(NotificationsLoaded(updatedNotifications));
  } catch (e, stackTrace) {
    print('Error adding notification: $e\n$stackTrace');
    emit(NotificationsError('فشل في إضافة الإشعار'));
  }
}
}
