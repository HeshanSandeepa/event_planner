import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/shared/camera/presentation/camera_bloc.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/strings.dart';
import 'bloc/profile_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? imagePath;

  _pushInfo() {
    Navigator.pushNamed(
      context,
      AppRouteEnum.infoPage.name,
    );
  }

  _takePicture() {
    BlocProvider.of<CameraBloc>(context).add(TakePhotoEvent());
  }

  _updatePicture(String imagePath) {
    BlocProvider.of<ProfileBloc>(
      context,
    ).add(UpdateProfileImage(imagePath: imagePath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CameraBloc, CameraState>(
        listener: (context, state) {
          if (state is PhotoTaken) {
            _updatePicture(state.photo);
          }
        },
        builder: (context, state) {
          if (state is PhotoTaken) {
            imagePath = state.photo;
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Strings.welcome,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  Strings.welcomeImage,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: imagePath == null
                      ? Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                _takePicture();
                              },
                              icon: const Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: Image.file(
                            File(imagePath!),
                            fit: BoxFit
                                .cover, // How the image should be inscribed in the box.
                          ).image,
                        ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    _pushInfo();
                  },
                  child: const Text(Strings.next),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
