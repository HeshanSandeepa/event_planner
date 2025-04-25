import 'package:event_planner/src/shared/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_planner/src/features/events/presentation/bloc/organiser_bloc.dart';
import 'package:event_planner/src/features/events/presentation/bloc/photo_bloc.dart';
import 'package:event_planner/src/features/events/presentation/bloc/post_bloc.dart';
import 'package:event_planner/src/features/events/presentation/widgets/event_horizontal_slider_view.dart';
import 'package:event_planner/src/features/events/presentation/widgets/event_organiser_view.dart';
import 'package:event_planner/src/features/events/presentation/widgets/event_post_count_view.dart';
import 'package:event_planner/src/features/events/presentation/widgets/event_slider_view.dart';

import 'package:event_planner/src/shared/widgets/notice_view.dart';

class EventHomePage extends StatefulWidget {
  const EventHomePage({super.key});

  @override
  State<EventHomePage> createState() => _EventHomePageState();
}

class _EventHomePageState extends State<EventHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchSliderPhotos();
    });
  }

  _fetchSliderPhotos() {
    BlocProvider.of<PhotoBloc>(context).add(FetchPhotosEvent());
  }

  _fetchOrganisers() {
    BlocProvider.of<OrganiserBloc>(context).add(FetchOrganiserEvent());
  }

  _fetchPosts() {
    BlocProvider.of<PostBloc>(context).add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // top slider
            BlocConsumer<PhotoBloc, PhotoState>(
              listener: (context, state) {
                if (state is PhotoFetched) {
                  _fetchOrganisers();
                }
              },
              builder: (context, state) {
                if (state is PhotoLoading) {
                  return const Expanded(
                      child: LoadingView(strokeColor: Colors.black));
                }
                if (state is PhotoError) {
                  return NoticeView(notice: state.message);
                }
                if (state is PhotoFetched) {
                  return EventSliderView(sliderImages: state.photos);
                }

                return const LoadingView(strokeColor: Colors.black);
              },
            ),
            //  organisers
            BlocConsumer<OrganiserBloc, OrganiserState>(
              listener: (context, state) {
                _fetchPosts();
              },
              builder: (context, state) {
                if (state is OrganiserError) {
                  return NoticeView(notice: state.message);
                }
                if (state is OrganiserFetched) {
                  return EventOrganiserView(organisers: state.organisers);
                }

                return const LoadingView(strokeColor: Colors.black);
              },
            ),
            BlocConsumer<PhotoBloc, PhotoState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is PhotoError) {
                  return NoticeView(notice: state.message);
                }
                if (state is PhotoFetched) {
                  return EventHorizontalSliderView(sliderImages: state.photos);
                }

                return const LoadingView(strokeColor: Colors.black);
              },
            ),
            BlocConsumer<PostBloc, PostState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is PostsError) {
                  return NoticeView(notice: state.message);
                }
                if (state is PostsFetched) {
                  return EventPostsCountView(posts: state.posts);
                }

                return const LoadingView(strokeColor: Colors.black);
              },
            ),
          ],
        ),
      ),
    );
  }
}
