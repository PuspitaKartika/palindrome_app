part of 'polindrome_cubit.dart';

sealed class PolindromeState extends Equatable {
  const PolindromeState();

  @override
  List<Object> get props => [];
}

final class PolindromeInitial extends PolindromeState {}

final class PolindromeSuccess extends PolindromeState {
  final String msg;

  const PolindromeSuccess({required this.msg});
}

final class PolindromeFailure extends PolindromeState {
  final String msg;

  const PolindromeFailure({required this.msg});
}
