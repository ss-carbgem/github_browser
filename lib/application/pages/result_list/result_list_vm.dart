import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class ResultListVm {
  List<String>? get result;
  String get keyword;

  void init(WidgetRef ref);

  void onKeywordChanged(String value);
  Future<List<String>> searchResult(String value);
}
