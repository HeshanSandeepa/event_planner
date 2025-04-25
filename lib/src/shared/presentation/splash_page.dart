import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/app_route_enum.dart';
import '../../core/utils/strings.dart';
import '../../features/auth/presentation/bloc/authenticate_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentUser(context);
    });
    super.initState();
  }

  _pushLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouteEnum.loginPage.name, (Route<dynamic> route) => false);
  }

  _pushHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouteEnum.homePage.name, (Route<dynamic> route) => false);
  }

  _getCurrentUser(BuildContext context) {
    BlocProvider.of<AuthenticateBloc>(context).add(GetCurrentUserRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticateBloc, AuthenticateState>(
          listener: (context, state) {
            if (state is Authenticated) {
              _pushHome(context);
              // Navigate to home screen
            } else {
              _pushLogin(context);
            }
          },
          child: Center(
            child: Text(
              Strings.welcome,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
