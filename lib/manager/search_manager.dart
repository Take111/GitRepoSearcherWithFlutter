import 'package:gitrepo_searcher/models/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchManager {
  final List<String> repos = ["AAA", "BBB", "CCC", "DDD", "EEE"];

  Future<List<Repository>> searchRepo(String word) async {
    var queryParameters = {"q": word};

    var uri =
        Uri.https("api.github.com", "/search/repositories", queryParameters);

    final responce = await http.get(uri);

    // TODO: 本当はresponce.statusCodeをprintに入れたいが方法が分からないので、インスタンスを作成している。。。
    final statusCode = responce.statusCode;

    if (statusCode == 200) {
      final list = Repositories.fromJson(json.decode(responce.body));
      // return Repositories.fromJson(json.decode(responce.body));
      return list.items;
    } else {
      print("Fatal Error: searchRepo: status code \$$statusCode");
    }
  }
}
