import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class SearchVm {
  void init(WidgetRef ref);

  String get keyword;
  bool get canTapSearch;

  void onKeywordChanged(String? value);
  void onSearchTapped(BuildContext context);
}
