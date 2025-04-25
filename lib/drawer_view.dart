import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/core/router/app_route_enum.dart';
import 'package:event_planner/src/features/auth/domain/entities/user.dart';
import 'package:event_planner/src/features/auth/presentation/bloc/authenticate_bloc.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  UserEntity? userEntity;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentUser();
    });
  }

  _getCurrentUser() {
    BlocProvider.of<AuthenticateBloc>(context).add(GetCurrentUserRequested());
  }

  _pushProfile() {
    Navigator.pushNamed(context, AppRouteEnum.profilePage.name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
          builder: (context, state) {
            if (state is Authenticated) {
              userEntity = state.user;
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child:
                            userEntity == null
                                ? Container()
                                : Image.file(
                                  File(userEntity!.photoUrl!),
                                  width: 100,
                                  height: 100,
                                  fit:
                                      BoxFit
                                          .cover, // How the image should be inscribed in the box.
                                ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            userEntity == null
                                ? ''
                                : ' ${userEntity!.lastName}',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            userEntity?.contactNumber ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          Text(
                            userEntity?.email ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.edit, size: 20, color: Colors.black),
                      ),
                    ),
                    title: Text('Profile'),
                    onTap: () {
                      _pushProfile();
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: Text('LogOut'),
                    onTap: () {
                      BlocProvider.of<AuthenticateBloc>(
                        context,
                      ).add(SignOutRequested());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
