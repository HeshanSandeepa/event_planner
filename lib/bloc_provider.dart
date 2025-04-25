import 'package:event_planner/src/shared/camera/data/camera_output_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/single_child_widget.dart';
import 'package:event_planner/src/core/network/dio_client.dart';
import 'package:event_planner/src/features/events/data/data_sources/photo_data_source_impl.dart';
import 'injectable.dart';
import 'src/features/auth/data/data_sources/firebase_data_source.dart';
import 'src/features/auth/data/data_sources/firebase_data_source_impl.dart';
import 'src/features/auth/data/repositories/auth_repository_impl.dart';
import 'src/features/auth/domain/repositories/auth_repository.dart';
import 'src/features/auth/domain/usecases/login_usecase.dart';
import 'src/features/auth/domain/usecases/register_usecase.dart';
import 'src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'src/features/auth/domain/usecases/update_profile_image_usecase.dart';
import 'src/features/auth/domain/usecases/update_profile_usecase.dart';
import 'src/features/auth/presentation/bloc/authenticate_bloc.dart';

import 'src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'src/features/auth/presentation/bloc/profile_bloc.dart';
import 'src/features/events/data/data_sources/comment_data_source.dart';
import 'src/features/events/data/data_sources/comment_data_source_impl.dart';
import 'src/features/events/data/data_sources/organiser_data_source.dart';
import 'src/features/events/data/data_sources/organiser_data_source_impl.dart';
import 'src/features/events/data/data_sources/photo_data_source.dart';
import 'src/features/events/data/data_sources/post_data_source.dart';
import 'src/features/events/data/data_sources/post_data_source_impl.dart';
import 'src/features/events/data/repositories/comment_repository_impl.dart';
import 'src/features/events/data/repositories/organiser_repository_impl.dart';
import 'src/features/events/data/repositories/photo_repository_impl.dart';
import 'src/features/events/data/repositories/post_repository_impl.dart';
import 'src/features/events/domain/repositories/comment_repository.dart';
import 'src/features/events/domain/repositories/organiser_repository.dart';
import 'src/features/events/domain/repositories/photo_repository.dart';
import 'src/features/events/domain/repositories/post_repository.dart';
import 'src/features/events/domain/usecases/get_comment_usecase.dart';
import 'src/features/events/domain/usecases/get_organiser_usecase.dart';
import 'src/features/events/domain/usecases/get_photo_usecase.dart';
import 'src/features/events/domain/usecases/get_post_usecase.dart';
import 'src/features/events/presentation/bloc/comment_bloc.dart';
import 'src/features/events/presentation/bloc/organiser_bloc.dart';
import 'src/features/events/presentation/bloc/photo_bloc.dart';
import 'src/features/events/presentation/bloc/post_bloc.dart';
import 'src/shared/camera/domain/camera_output_repository.dart';
import 'src/shared/camera/presentation/camera_bloc.dart';

List<SingleChildWidget> createBlocProviders(BuildContext context) {
  return [
    Provider<FirebaseDataSource>(
      create: (_) => FirebaseDataSourceImpl(FirebaseAuth.instance),
    ),
    Provider<AuthRepository>(
      create: (context) =>
          AuthRepositoryImpl(context.read<FirebaseDataSource>()),
    ),
    Provider<LoginUseCase>(
      create: (context) => LoginUseCase(context.read<AuthRepository>()),
    ),
    Provider<RegisterUseCase>(
      create: (context) => RegisterUseCase(context.read<AuthRepository>()),
    ),
    Provider<GetCurrentUserUseCase>(
      create: (context) =>
          GetCurrentUserUseCase(context.read<AuthRepository>()),
    ),
    Provider<SignOutUseCase>(
      create: (context) => SignOutUseCase(context.read<AuthRepository>()),
    ),
    Provider<PhotoDataSource>(
      create: (_) => PhotoDataSourceImpl(dioClient: getIt<DioClient>()),
    ),
    Provider<PhotoRepository>(
      create: (context) => PhotoRepositoryImpl(
        remoteDataSource: context.read<PhotoDataSource>(),
      ),
    ),
    Provider<GetPhotosUseCase>(
      create: (context) =>
          GetPhotosUseCase(repository: context.read<PhotoRepository>()),
    ),
    Provider<OrganiserDataSource>(
      create: (_) => OrganiserDataSourceImpl(dioClient: getIt<DioClient>()),
    ),
    Provider<OrganiserRepository>(
      create: (context) => OrganiserRepositoryImpl(
        remoteDataSource: context.read<OrganiserDataSource>(),
      ),
    ),
    Provider<GetOrganiserUseCase>(
      create: (context) => GetOrganiserUseCase(
        repository: context.read<OrganiserRepository>(),
      ),
    ),
    Provider<PostDataSource>(
      create: (_) => PostDataSourceImpl(dioClient: getIt<DioClient>()),
    ),
    Provider<PostRepository>(
      create: (context) => PostRepositoryImpl(
        remoteDataSource: context.read<PostDataSource>(),
      ),
    ),
    Provider<GetPostUseCase>(
      create: (context) =>
          GetPostUseCase(repository: context.read<PostRepository>()),
    ),
    Provider<CommentDataSource>(
      create: (_) => CommentDataSourceImpl(dioClient: getIt<DioClient>()),
    ),
    Provider<CommentRepository>(
      create: (context) => CommentRepositoryImpl(
        remoteDataSource: context.read<CommentDataSource>(),
      ),
    ),
    BlocProvider<AuthenticateBloc>(
      create: (context) => AuthenticateBloc(
        loginUseCase: context.read<LoginUseCase>(),
        registerUseCase: context.read<RegisterUseCase>(),
        getCurrentUserUseCase: context.read<GetCurrentUserUseCase>(),
        signOutUseCase: context.read<SignOutUseCase>(),
      )..add(GetCurrentUserRequested()),
    ),
    BlocProvider<PhotoBloc>(
      create: (context) =>
          PhotoBloc(getPhotosUseCase: context.read<GetPhotosUseCase>()),
    ),
    BlocProvider<OrganiserBloc>(
      create: (context) => OrganiserBloc(
        getOrganiserUseCase: context.read<GetOrganiserUseCase>(),
      ),
    ),
    BlocProvider<PostBloc>(
      create: (context) =>
          PostBloc(getPostUseCase: context.read<GetPostUseCase>()),
    ),
    Provider<GetCommentUseCase>(
      create: (context) =>
          GetCommentUseCase(repository: context.read<CommentRepository>()),
    ),
    BlocProvider<CommentBloc>(
      create: (context) =>
          CommentBloc(getCommentUseCase: context.read<GetCommentUseCase>()),
    ),
    Provider<UpdateProfileUseCase>(
      create: (context) =>
          UpdateProfileUseCase(authRepository: context.read<AuthRepository>()),
    ),
    Provider<UpdateProfileImageUseCase>(
      create: (context) =>
          UpdateProfileImageUseCase(authRepository: context.read<AuthRepository>()),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(
        updateProfileUseCase: context.read<UpdateProfileUseCase>(),
        updateProfileImageUseCase: context.read<UpdateProfileImageUseCase>(),
        getCurrentUserUseCase: context.read<GetCurrentUserUseCase>(),
      ),
    ),
    Provider<CameraOutputRepository>(
      create: (context) => CameraOutputRepositoryImpl(),
    ),
    BlocProvider<CameraBloc>(
      create: (context) => CameraBloc(
        cameraOutputRepository: context.read<CameraOutputRepository>(),
      ),
    ),
  ];
}
