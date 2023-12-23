import 'package:dio/dio.dart';
import 'package:palindrome_app/constants/api.dart';
import 'package:palindrome_app/models/user_model.dart';

class UserRepo {
  final Dio _dio = Dio();

  Future<List<UserDataModel>> getUser({required int page}) async {
    try {
      final res = await _dio.get("${baseUrl}users?page=$page&per_page=10");

      return List<UserDataModel>.from(
          (res.data["data"] as Iterable).map((e) => UserDataModel.fromJson(e)));
    } catch (error) {
      throw Exception("Mohon maaf terjadi kesalahan");
    }
  }
}
