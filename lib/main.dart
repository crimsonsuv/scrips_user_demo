import 'package:after_init/after_init.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/di/dependency_injection.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/generated/l10n.dart' as sharedL10n;
import 'package:scrips_ua/core/bloc/core_bloc.dart';
import 'package:scrips_ua/core/constants/app_config.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';
import 'package:scrips_ua/core/route/router.dart';
import 'package:scrips_ua/di/dependency_injection.dart';
import 'package:scrips_ua/generated/l10n.dart';

setUpAll() async {
  setupLocator();
  locator.allowReassignment = true;

  await Configuration.loadConfig();

  initCoreServiceLocator();

  initServiceLocator();
  sl.allowReassignment = true;

  initUAServiceLocator();
}

void main() async {
  await setUpAll();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterInitMixin<MyApp> {
  final bloc = uaSl<CoreBloc>();

  String localeCode = UA_DEFAULT_LOCALE_CODE;

  String localeCountry = UA_DEFAULT_LOCALE_COUNTRY;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.dispatch(
      GetLocaleEvent(),
    );
  }

  @override
  void didInitState() {
    // TODO: implement didInitState
    bloc.dispatch(
        SetNewLocalEvent(localeCode: localeCode, localeCountry: localeCountry));
  }

  @override
  Widget build(BuildContext context) {
    try {
      return createApp(context);
    } catch (ex) {
      return Container();
    }
  }

  Widget createApp(BuildContext context) {
    return BlocProvider<CoreBloc>(
        builder: (_) => uaSl<CoreBloc>(),
        child: BlocBuilder<CoreBloc, CoreState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetLocaleState) {
                localeCode = state.data.localeCode;
                localeCountry = state.data.localeCountry;
                S.load(Locale(localeCode, localeCountry));
                sharedL10n.S.load(Locale(localeCode, localeCountry));
              } else if (state is SetNewLocalState) {
                localeCode = state.data.localeCode;
                localeCountry = state.data.localeCountry;
                S.load(Locale(localeCode, localeCountry));
                sharedL10n.S.load(Locale(localeCode, localeCountry));
              }
              return PlatformApp(
                // locale specific
                localizationsDelegates: [
                  S.delegate,
                  sharedL10n.S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                locale: Locale("en", ""),
                supportedLocales: S.delegate.supportedLocales,
                initialRoute: getInitialRoute(context),
                onGenerateRoute: Router.generateRoute,
                // general
                title: currentAppName,
//                theme: ThemeData(
//                  primarySwatch: getCurrentAppPrimarySwatch(context),
//                ),
                //  navigation
                navigatorKey:
                GlobalKey<NavigatorState>(debugLabel: 'main-navigator-key'),
                builder: (BuildContext context, Widget child) {
                  setCurrentAppType(context, S.of(context), AppType.UA);
                  return DevicePreview.appBuilder(
                    context,
                    Navigator(
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => child,
                      ),
                    ),
                  );
                },
              );
            }));
  }

  String getInitialRoute(BuildContext context) {
    return AppRoutePaths.Landing;
  }
}
