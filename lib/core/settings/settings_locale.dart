import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/data_models/general/global.dart';
import 'package:scrips_core/data_models/locale/supported_locale.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/widgets/locale/locale_list_item.dart';
import 'package:scrips_ua/core/bloc/core_bloc.dart';
import 'package:scrips_ua/di/dependency_injection.dart';

class SettingsLocaleSelectorView extends StatefulWidget {
  @override
  _SettingsLocaleSelectorViewState createState() =>
      _SettingsLocaleSelectorViewState();
}

class _SettingsLocaleSelectorViewState
    extends State<SettingsLocaleSelectorView> {
  final List<SupportedLocale> localesList = supportedLocales;
  final bloc = uaSl<CoreBloc>();
  Global data;

  @override
  void initState() {
    bloc.add(GetLocaleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoreBloc>(
      create: (_) => bloc,
      child: BlocBuilder<CoreBloc, CoreState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetLocaleState) {
            data = state.data;
          } else if (state is SetNewLocalState) {}
          return Scaffold(
            body: Container(
              child: Center(
                child: Padding(
                  padding: UIHelper.defaultPadding,
                  child: SizedBox(
                    child: _buildLocalesList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildLocalesList() {
    return ListView.builder(
      itemCount: localesList.length ?? 0,
      itemBuilder: (context, index) {
        SupportedLocale item = localesList[index];
        return LocaleListItem(
          showLabel: true,
          showIcon: false,
          center: false,
          item: item,
          isSelected: item.localeCode == data?.localeCode &&
              item.localeCountry == data?.localeCountry,
          onTap: () {
            Navigator.pop(context);
            bloc.add(SetNewLocalEvent(
                localeCode: item.localeCode, localeCountry: item.localeCode));
          },
        );
      },
    );
  }
}
