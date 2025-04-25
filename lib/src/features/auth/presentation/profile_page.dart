import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/features/auth/presentation/bloc/profile_bloc.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
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
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _takePicture();
                                    },
                                    icon: const Icon(Icons.camera_alt_outlined),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _firstNameController,
                    decoration:
                        const InputDecoration(labelText: Strings.hintFirstName),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _lastNameController,
                    decoration:
                        const InputDecoration(labelText: Strings.hintLastName),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration:
                        const InputDecoration(labelText: Strings.hintEmail),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: Strings.hintPhone),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _addressController,
                    decoration:
                        const InputDecoration(labelText: Strings.hintAddress),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (editEnabled) {
                        BlocProvider.of<ProfileBloc>(context).add(
                          UpdateProfile(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            contactNumber: _phoneNumberController.text.trim(),
                            address: _addressController.text.trim(),
                          ),
                        );
                      } else {
                        setState(() {
                          editEnabled = true;
                        });
                      }
                    },
                    child: Text(editEnabled ? 'Save' : 'Edit'),
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
