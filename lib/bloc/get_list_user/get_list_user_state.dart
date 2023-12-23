part of 'get_list_user_cubit.dart';

sealed class GetListUserState extends Equatable {
  const GetListUserState();

  @override
  List<Object> get props => [];
}

final class GetListUserInitial extends GetListUserState {}

final class GetListUserLoading extends GetListUserState {}

final class GetListUserSuccess extends GetListUserState {
  final UserModel data;

  const GetListUserSuccess({required this.data});
}

final class GetListUserFailure extends GetListUserState {
  final String message;

  const GetListUserFailure({required this.message});
}
