import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:github_browser/application/widgets/templates/not_login_template.dart';

import 'result_list_vm.dart';

class ResultListPage extends ConsumerStatefulWidget {
  static const kParamKeyword = 'keyword';
  static const path = '/result_list/:$kParamKeyword';
  const ResultListPage(this.keyword, {super.key});

  final String keyword;

  @override
  ConsumerState<ResultListPage> createState() => _ResultListPageState();
}

class _ResultListPageState extends ConsumerState<ResultListPage> {
  final _vm = GetIt.I<ResultListVm>();

  @override
  void initState() {
    super.initState();
    _vm.init(ref);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _vm.onKeywordChanged(widget.keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotLoginTemplate(
      appTitle:
          '${AppLocalizations.of(context).result_list_page_title}  [${_vm.keyword}]',
      child: FutureBuilder(
          future: _vm.searchResult(widget.keyword),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error!.toString());
            } else if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final items = snapshot.data!;

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Text(items[index]);
                });
          }),
    );
  }
}
