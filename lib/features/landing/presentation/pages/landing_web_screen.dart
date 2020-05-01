import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/di/dependency_injection.dart';
import 'package:scrips_ua/features/landing/presentation/bloc/landing/landing_bloc.dart';
import 'package:scrips_ua/features/landing/presentation/widgets/header_widgets.dart';
import 'package:scrips_ua/features/landing/presentation/widgets/footer_widgets.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({
    Key key,
  }) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final bloc = uaSl<LandingBloc>();
  bool isLoading = false;

  @override
  void initState() {
    bloc.dispatch(GetLoggedUser());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

//  void _goToHomeIfLoggedIn(User user) {
//    final bool isLoggedIn =
//        user?.userId?.value != null && user?.userId?.value != '';
//    if (isLoggedIn && Configuration.goToHomeIfLoggedIn) {
//      // we need to call this to ensure menu items are loaded, etc
//      Future.delayed(Duration(milliseconds: 100), () {
//        Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
//      });
//    }
//  }



  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is OAuthLoginState) {
              print("ACCESS CODE IS : ${state.userData.emailAddress}");
            } else if (state is ErrorState) {
              showToastWidget(
                ToastWidget(
                  message: state.message,
                  backgroundColor: red,
                ),
                position: ToastPosition.top,
                context: context,
                duration: Duration(seconds: 4),
              );
            } else if (state is LoadingBeginState) {
              isLoading = true;
            } else if (state is LoadingEndState) {
              isLoading = false;
            }
          },
          child: BlocBuilder<LandingBloc, LandingState>(
              bloc: bloc,
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: bgColor,
                  body: Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: SimpleView(
                      showBackButton: false,
                      showAppIcon: true,
                      showNext: false,
                      iconImage: Images.instance.asset(name: "ic_appicon"),
                      headerWidgets: headerWidgets(context: context),
                      bodyWidgets: [Container()],
                      footerWidgets: footerWidgets(
                          context: context,
                          bloc: bloc,
                          isLoading: isLoading),
                    ),
                  ),
                );
              })),
    );
  }
}
