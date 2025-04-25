import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/shared/presentation/widgets/loading_view.dart';

import '../../../core/utils/strings.dart';
import '../../../core/utils/validator.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registers')),
      body: BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Registration successful! User ID: ${state.user.uid}',
                ),
              ),
            );
            // Navigate to home screen
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration failed: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: LoadingView());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
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
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
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
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _repeatPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Repeat Password'),
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
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _singUp();
                    },
                    child: Text('Register'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Navigate back to login screen
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account? Login'),
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
