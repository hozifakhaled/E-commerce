import 'package:ecommercefirebase/featrue/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';

abstract class DatabaseConsumer {
  Future<void> createUserWithEmailAndPassword(SinupEntites email,SinupEntites password );
    Future<void> signInWithEmailAndPassword(LoginEntites email,LoginEntites password );
}