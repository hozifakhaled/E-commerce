import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  cacheid(String value) {
    CacheHelper().saveData(key: 'id',value:value );
  }
}
