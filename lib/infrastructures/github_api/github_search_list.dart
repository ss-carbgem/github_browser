import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../domains/infrastructures/search_list.dart';

class GithubSearchList implements SearchList {
  final client = GetIt.I<http.Client>();

  @override
  Future<List<String>> searchList(String keyword) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      'search result1',
      'search result2',
    ];
  }
}
