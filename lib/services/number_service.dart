import 'package:dio/dio.dart';

const String _baseUrl = 'https://random-data-api.com/api';

class NumberService {
  final Dio _dio;

  NumberService._(this._dio);

  factory NumberService() {
    final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));

    return NumberService._(dio);
  }

  Future<int> getRandomInt() async {
    final Response<dynamic> response = await _dio.get<dynamic>('/number/random_number');

    return (response.data['decimal'] as double).toInt();
  }
}
