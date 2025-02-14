import 'package:ecommercefirebase/features/auth/sinup/domin/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/repository/sinup_repository.dart';

class AddUsers {
  final SinupRepository repository;
  AddUsers(this.repository);

  Future<void> call(AddUserEntitiey user) async {
    return await repository.adduser(
      user,
    );
  }
}
