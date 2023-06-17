import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cbi_bitte_flutter/themes.dart';
import 'package:cbi_bitte_flutter/gen/assets.gen.dart';

import '{{page_name}}_vm.dart';
import 'impl/{{page_name}}_vm_impl.dart';

class {{page_name.pascalCase()}}Page extends ConsumerStatefulWidget {
  static const path = '/{{page_name}}_page';
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  ConsumerState<{{page_name.pascalCase()}}Page> createState() => _{{page_name.pascalCase()}}PageState();
}

class _{{page_name.pascalCase()}}PageState extends ConsumerState<{{page_name.pascalCase()}}Page> {
  final _vm = {{page_name.pascalCase()}}VmImpl();

  @override
  void initState() {
    super.initState();
    _vm.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
