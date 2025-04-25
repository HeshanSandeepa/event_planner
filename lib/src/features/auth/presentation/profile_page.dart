import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/features/auth/presentation/bloc/profile_bloc.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/validator.dart';
import '../../../shared/camera/presentation/camera_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool editEnabled = false;
  String? imagePath;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentUser();
    });
  }

  _getCurrentUser() {
    BlocProvider.of<ProfileBloc>(context).add(GetCurrentProfile());
  }

  _pushHome() {
    Navigator.pushNamed(context, AppRouteEnum.homePage.name);
  }

  _takePicture() {
    BlocProvider.of<CameraBloc>(context).add(TakePhotoEvent());
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
      body: SingleChildScrollView(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              editEnabled = false;
              _pushHome();
            } else if (state is ProfileFailure) {}
          },
          builder: (context, state) {
            if (state is CurrentProfileGot) {
              final user = state.user;
              imagePath = user.photoUrl;
              _firstNameController.text = user.firstName ?? '';
              _lastNameController.text = user.lastName ?? '';
              _emailController.text = user.email ?? '';
              _phoneNumberController.text = user.contactNumber ?? '';
              _addressController.text = user.contactNumber ?? '';
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: imagePath == null
                            ? Center(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : Center(
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: Image.file(
                                        File(imagePath!),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ).image,
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            _takePicture();
                                          },
                                          icon: const Icon(
                                              Icons.camera_alt_outlined),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      autofocus: true,
                      controller: _firstNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: Strings.hintFirstName),
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
                      decoration: const InputDecoration(
                          labelText: Strings.hintLastName),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      enabled: false,
                      controller: _emailController,
                      decoration:
                          const InputDecoration(labelText: Strings.hintEmail),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(12)],
                      decoration:
                          const InputDecoration(labelText: Strings.hintPhone),
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
                      decoration:
                          const InputDecoration(labelText: Strings.hintAddress),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Strings.invalidText;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _updateInfo();
                      },
                      child: const Text(Strings.save),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
