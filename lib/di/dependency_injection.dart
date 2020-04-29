import 'package:get_it/get_it.dart';
import 'package:scrips_ua/core/bloc/core_bloc.dart';


final uaSl = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = true;

Future<void> initUAServiceLocator() async {
  /// Core
  // bloc
  uaSl.registerFactory(() => CoreBloc());


}
