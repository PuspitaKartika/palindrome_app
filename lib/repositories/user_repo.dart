import 'package:dio/dio.dart';
import 'package:palindrome_app/constants/api.dart';
import 'package:palindrome_app/models/user_model.dart';

class UserRepo {
  final Dio _dio = Dio();

  Future<UserModel> getUser({required int page}) async {
    try {
      final res = await _dio.get("${baseUrl}users?page=$page&per_page=10");

      return UserModel.fromJson(res.data);
    } catch (error) {
      throw Exception("Mohon maaf terjadi kesalahan");
    }
  }
}
