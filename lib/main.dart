import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_browser/application/pages/result_list/result_list_vm.dart';
import 'package:github_browser/application/themes.dart';
import 'package:github_browser/infrastructures/github_api/github_search_list.dart';
import 'application/pages/result_list/impl/result_list_vm_impl.dart';
import 'application/pages/search/impl/search_vm_impl.dart';
import 'application/pages/search/search_vm.dart';
import 'application/router.dart';
import 'package:http/http.dart' as http;

import 'domains/infrastructures/search_list.dart';

void main() {
  _initializeDI();
  runApp(const ProviderScope(child: MyApp()));
}

/// DIの初期化
void _initializeDI() {
  GetIt.I.registerLazySingleton<http.Client>(() => http.Client());

  GetIt.I.registerFactory<SearchVm>(() => SearchVmImpl());
  GetIt.I.registerFactory<ResultListVm>(() => ResultListVmImpl());
  GetIt.I.registerFactory<SearchList>(() => GithubSearchList());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
