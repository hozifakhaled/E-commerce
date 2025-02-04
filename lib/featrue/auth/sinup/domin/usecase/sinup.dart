import 'package:dartz/dartz.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/repository/sinup_repository.dart';

class Sinup {
  final SinupRepository sinupRepository;

  Sinup({required this.sinupRepository});

  Future< void> call(SinupEntites  email, SinupEntites password) async {
    return await sinupRepository.createUserWithEmailAndPassword(email, password);
  }
}