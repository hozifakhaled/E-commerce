import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/repository/sinup_repository.dart';

class Sinup {
  final SinupRepository sinupRepository;

  Sinup({required this.sinupRepository});

  Future< void> call(SinupEntites  user) async {
    return await sinupRepository.createUserWithEmailAndPassword(user,);
  }
}