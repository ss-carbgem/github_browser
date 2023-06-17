import 'package:github_browser/application/pages/result_list/result_list_page.dart';
import 'package:github_browser/application/pages/search/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: SearchPage.path,
  routes: [
    GoRoute(
        path: SearchPage.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: SearchPage());
        }),
    GoRoute(
        path: ResultListPage.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final keyword = state.pathParameters[ResultListPage.kParamKeyword]!;
          return MaterialPage(child: ResultListPage(keyword));
        }),
  ],
);
