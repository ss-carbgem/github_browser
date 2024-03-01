import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../{{page_name}}_vm.dart';

part '{{page_name}}_vm_impl.gvm.dart';

class {{page_name.pascalCase()}}VmImpl
    with _${{page_name.pascalCase()}}VmImpl
    implements {{page_name.pascalCase()}}Vm {

  @override
  void init(WidgetRef ref) {
    _init(ref);
  }
}
