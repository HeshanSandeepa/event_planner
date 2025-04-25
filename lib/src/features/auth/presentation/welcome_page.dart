import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/shared/camera/presentation/camera_bloc.dart';

import 'bloc/profile_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? imagePath;

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
      appBar: AppBar(title: Text('Profile Image')),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child:
                      imagePath == null
                          ? Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  _takePicture();
                                },
                                icon: Icon(Icons.camera_alt_outlined),
                              ),
                            ),
                          )
                          : Image.file(
                            File(imagePath!),
                            width: 200,
                            height: 200,
                            fit:
                                BoxFit
                                    .cover, // How the image should be inscribed in the box.
                          ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/info');
                    },
                    child: Text('Next ->'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
