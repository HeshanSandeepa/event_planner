import 'package:flutter/material.dart';
import 'package:event_planner/src/features/events/data/models/post_model.dart';

class EventPostsView extends StatelessWidget {
  const EventPostsView({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: PostCard(postModel: post),
          );
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
            const Icon(Icons.arrow_forward, color: Colors.black),
          ],
        ),
        Text(
          '${postModel.body} ',
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
