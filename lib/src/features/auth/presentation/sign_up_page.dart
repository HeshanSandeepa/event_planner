import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/validator.dart';
import '../../../shared/widgets/loading_view.dart';
import 'bloc/authenticate_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  _singUp() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    BlocProvider.of<AuthenticateBloc>(context).add(
      RegisterRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  _pushWelcome() {
    Navigator.pushNamedAndRemoveUntil(context, AppRouteEnum.welcomePage.name,
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state is InitialAuthenticated) {
            _pushWelcome();
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
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
                    decoration:
                        const InputDecoration(labelText: Strings.hintEmail),
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
                    decoration:
                        const InputDecoration(labelText: Strings.hintPassword),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _repeatPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: Strings.hintConfirmPassword),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidPassword;
                      }
                      if (!Validator.isValidPassword(value)) {
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
                      _singUp();
                    },
                    child: const Text(Strings.signUp),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to login screen
                      Navigator.pop(context);
                    },
                    child: const Text(Strings.login),
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
