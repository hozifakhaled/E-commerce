import 'package:ecommercefirebase/features/auth/sinup/domain/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domain/entities/sinup_entites.dart';

abstract class SinupRepository {
  Future< void> createUserWithEmailAndPassword(SinupEntites  user);
  Future< void> adduser(AddUserEntitiey user, );
}
