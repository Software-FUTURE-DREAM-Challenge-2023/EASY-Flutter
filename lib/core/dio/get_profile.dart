import 'package:dio/dio.dart';
import 'package:easy_flutter/core/model/user_profile_model.dart';
import 'package:easy_flutter/secret.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<UserProfileModel> getProfile() async {
  FlutterSecureStorage storage = FlutterSecureStorage();

  final dio = Dio();

  dynamic accessToken = await storage.read(key: 'accessToken');

  print(accessToken);

  try {
    final resp = await dio.get(
      '$baseUrl/api/oauth/profile',
      options: Options(
          headers: {
            'authorization': 'Bearer $accessToken',
          }
      ),
    );
    if (resp.statusCode == 200) {
      print('성공');
      return UserProfileModel.fromJson(resp.data);
    } else {
      throw Exception();
    }
  } catch (err) {
    throw Exception();
  }
}