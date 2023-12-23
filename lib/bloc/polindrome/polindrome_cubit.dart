import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'polindrome_state.dart';

class PolindromeCubit extends Cubit<PolindromeState> {
  PolindromeCubit() : super(PolindromeInitial());

  void checkPalindrome(String input) {
    String cleanInput = input.replaceAll(' ', '').toLowerCase();
    bool isPalindrome = cleanInput == cleanInput.split('').reversed.join('');

    if (isPalindrome) {
      emit(const PolindromeSuccess(msg: 'Is Palindrome!'));
    } else {
      emit(const PolindromeFailure(msg: 'Not a Palindrome.'));
    }
  }
}
