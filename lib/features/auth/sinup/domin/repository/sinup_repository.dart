import 'package:ecommercefirebase/features/auth/sinup/domin/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';

abstract class SinupRepository {
  Future< void> createUserWithEmailAndPassword(SinupEntites  email, SinupEntites password);
  Future< void> adduser(AddUserEntitiey user, );
}
