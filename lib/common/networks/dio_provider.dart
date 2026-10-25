import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ),
);