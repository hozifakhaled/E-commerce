import 'package:dartz/dartz.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';

abstract class SinupRepository {
  Future< void> createUserWithEmailAndPassword(SinupEntites  email, SinupEntites password);
}
