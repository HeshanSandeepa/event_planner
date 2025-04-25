import 'package:event_planner/src/shared/widgets/notice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/core/utils/validator.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
import '../../../shared/widgets/loading_view.dart';
import 'bloc/authenticate_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _pushSignUp() {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouteEnum.signUpPage.name, (Route<dynamic> route) => false);
  }

  _pushHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouteEnum.homePage.name, (Route<dynamic> route) => false);
  }

  _login() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    BlocProvider.of<AuthenticateBloc>(context).add(
      LoginRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state is Authenticated) {
            _pushHome(context);
          }
        },
        builder: (context, state) {
          if (state is AuthFailure) {
            return NoticeView(notice: state.message);
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Strings.welcome,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    Strings.welcomeTwo,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: Strings.hintEmail,
                      icon: Icon(
                        Icons.mail,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidEmail;
                      }
                      if (!Validator.isValidEmail(value)) {
                        return Strings.invalidPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: Strings.hintPassword,
                      icon: Icon(
                        Icons.password,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidPassword;
                      }
                      if (!Validator.isValidPassword(value)) {
                        return Strings.invalidPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  if (state is AuthLoading) const Center(child: LoadingView()),
                  ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: const Text(Strings.login),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _pushSignUp();
                    },
                    child: const Text(Strings.signUp),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
