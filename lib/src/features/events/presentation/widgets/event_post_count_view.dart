import 'package:flutter/material.dart';

import '../../../../core/router/app_route_enum.dart';
import '../../data/models/post_model.dart';

class EventPostsCountView extends StatelessWidget {
  const EventPostsCountView({super.key, required this.posts});

  final List<PostModel> posts;

  _pushPosts(BuildContext context, List<PostModel> posts) {
    Navigator.pushNamed(
      context,
      AppRouteEnum.postPage.name,
      arguments: {"posts": posts},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '${posts.length} ',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: () {
                _pushPosts(context, posts);
              },
              child: Text(
                'Posts',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
