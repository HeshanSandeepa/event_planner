import 'package:event_planner/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/src/features/events/data/models/post_model.dart';

import '../../../core/router/app_route_enum.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key, required this.posts});

  final List<PostModel> posts;

  _onPostTap(BuildContext context, int postId) {
    Navigator.pushNamed(
      context,
      AppRouteEnum.commentPage.name,
      arguments: {"post_id": postId},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.posts)),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];
          return GestureDetector(
            onTap: () {
              _onPostTap(context, post.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: PostCard(postModel: post),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel postModel;

  const PostCard({super.key, required this.postModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '${postModel.title} ',
                style: Theme.of(context).textTheme.bodyLarge,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
          ],
        ),
        Text(
          '${postModel.body} ',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.start,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
