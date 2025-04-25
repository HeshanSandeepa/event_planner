import 'package:event_planner/src/core/utils/strings.dart';
import 'package:event_planner/src/features/events/data/models/comment_model.dart';
import 'package:event_planner/src/features/events/presentation/bloc/comment_bloc.dart';
import 'package:event_planner/src/shared/widgets/loading_view.dart';
import 'package:event_planner/src/shared/widgets/notice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentPage extends StatefulWidget {
  const PostCommentPage({super.key, required this.postId});

  final int postId;

  @override
  State<PostCommentPage> createState() => _PostCommentPageState();
}

class _PostCommentPageState extends State<PostCommentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchPostsComments(widget.postId);
    });
  }

  _fetchPostsComments(int postId) {
    BlocProvider.of<CommentBloc>(context)
        .add(FetchCommentsEvent(postId: postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.postComments)),
      body: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CommentError) {
            return NoticeView(notice: state.message);
          }
          if (state is CommentFetched) {
            final comments = state.comments;

            return ListView.separated(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                var commentModel = comments[index];
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CommentCard(commentModel: commentModel),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }

          return const LoadingView();
        },
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final CommentModel commentModel;

  const CommentCard({super.key, required this.commentModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${commentModel.name} ',
          style: Theme.of(context).textTheme.bodyLarge,
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${commentModel.email} ',
          style: Theme.of(context).textTheme.bodyLarge,
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${commentModel.body} ',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
