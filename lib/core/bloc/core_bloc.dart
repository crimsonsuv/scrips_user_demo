import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/data_models/general/global.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  Global data = Global();

  @override
  CoreState get initialState => InitialCoreState();

  @override
  Stream<CoreState> mapEventToState(CoreEvent event) async* {
    if (event is GetLocaleEvent) {
      yield GetLocaleState(data: data);
    } else if (event is SetNewLocalEvent) {
      setNewLocale(event.localeCode, event.localeCountry);
      yield SetNewLocalState(data);
    }
  }

  void setNewLocale(String localeCode, String localeCountry) {
    this.data.localeCode = localeCode;
    this.data.localeCountry = localeCountry;
  }
}
