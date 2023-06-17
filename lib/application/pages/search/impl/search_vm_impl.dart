import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_browser/application/pages/result_list/result_list_page.dart';
import 'package:go_router/go_router.dart';

import '../search_vm.dart';

part 'search_vm_impl.gvm.dart';

class SearchVmImpl with _$SearchVmImpl implements SearchVm {
  @override
  void init(WidgetRef ref) {
    _init(ref);
  }

  @override
  void onKeywordChanged(String? value) {
    if (value == null) {
      return;
    }
    _keyword(value);
  }

  @override
  void onSearchTapped(BuildContext context) {
    final path = ResultListPage.path
        .replaceFirst(':${ResultListPage.kParamKeyword}', keyword);
    GoRouter.of(context).push(path);
  }

  @override
  bool get canTapSearch => keyword.isNotEmpty;
}
