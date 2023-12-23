import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_app/models/user_model.dart';
import 'package:palindrome_app/repositories/user_repo.dart';

part 'get_list_user_state.dart';

class GetListUserCubit extends Cubit<GetListUserState> {
  GetListUserCubit() : super(GetListUserInitial());
  final _repo = UserRepo();

  void fetchData(int page) async {
    emit(GetListUserLoading());
    try {
      final data = await _repo.getUser(page: page);
      emit(GetListUserSuccess(data: data));
    } catch (e) {
      emit(GetListUserFailure(message: e.toString()));
    }
  }
}
