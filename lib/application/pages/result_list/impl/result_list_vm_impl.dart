import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:github_browser/domains/infrastructures/search_list.dart';

import '../result_list_vm.dart';

part 'result_list_vm_impl.gvm.dart';

class ResultListVmImpl with _$ResultListVmImpl implements ResultListVm {
  @override
  void init(WidgetRef ref) {
    _init(ref);
  }

  @override
  Future<List<String>> searchResult(String keyword) {
    final searchResult = GetIt.I<SearchList>();
    return searchResult.searchList(keyword);
  }

  @override
  void onKeywordChanged(String value) {
    if (value == null) {
      return;
    }
    _keyword(value);
  }
}
