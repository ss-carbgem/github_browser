import '../infrastructures/github_api/github_search_list.dart';

class ResultList {
  Future<List<String>> searchResult(String keyword) {
    final searchList = GithubSearchList();
    return searchList.searchList(keyword);
  }
}
