import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/features/auth/presentation/bloc/profile_bloc.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/validator.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

  _pushHome() {
    Navigator.pushNamed(context, AppRouteEnum.homePage.name);
  }

  _updateInfo() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    BlocProvider.of<ProfileBloc>(context).add(
      UpdateProfile(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        contactNumber: _phoneNumberController.text.trim(),
        address: _addressController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            _pushHome();
          } else if (state is ProfileFailure) {}
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Strings.infoTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    Strings.infoSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    autofocus: true,
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: Strings.hintFirstName),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidText;
                      }
                      if (!Validator.isValidText(value)) {
                        return Strings.invalidText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidText;
                      }
                      if (!Validator.isValidText(value)) {
                        return Strings.invalidText;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: Strings.hintLastName),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(12)],
                    decoration: const InputDecoration(labelText: Strings.hintPhone),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidPhone;
                      }
                      if (!Validator.isValidPhoneNumber(value)) {
                        return Strings.invalidPhone;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: Strings.hintAddress),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Strings.invalidText;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to register screen
                            Navigator.pop(context);
                          },
                          child: const Text(Strings.back),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _updateInfo();
                          },
                          child: const Text(Strings.next),
                        ),
                      ),
                    ],
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
