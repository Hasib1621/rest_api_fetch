import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_fetch/cubit/user_cubit_state.dart';
import 'package:rest_api_fetch/model/user_model.dart';
import 'package:rest_api_fetch/service/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
