part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}
class NotificationsLoaded extends NotificationsState {
  final List<NotificationModel> notifications;
  const NotificationsLoaded(this.notifications);

  @override
  List<Object> get props => [notifications];
}

class NotificationsError extends NotificationsState {
  final String message;
  const NotificationsError(this.message);

  @override
  List<Object> get props => [message];
}