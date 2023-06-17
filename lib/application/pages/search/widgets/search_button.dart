import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../search_vm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../gen/assets.gen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required SearchVm vm,
  }) : _vm = vm;

  final SearchVm _vm;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: _vm.canTapSearch ? () => _vm.onSearchTapped(context) : null,
      label: Text(AppLocalizations.of(context).button_search),
      icon: SvgPicture.asset(Assets.images.search,
          height: 24,
          colorFilter: ColorFilter.mode(
              _vm.canTapSearch
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.secondary,
              BlendMode.srcIn)),
    );
  }
}
