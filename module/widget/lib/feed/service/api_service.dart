import 'package:dio/dio.dart';

import '../model/model.dart';

class NewApiService {
  String url = "https://jsonplaceholder.typicode.com/todos";
  final Dio _dio = Dio();

  Future<List<Todos>> fetchData() async {
    Response response = await _dio.get(url);
    var a = (response.data as List);
    List<Todos> todos =
    (response.data as List).map((e) => Todos.fromJson(e as Map<String, dynamic>)).toList();
    return todos;
  }
}