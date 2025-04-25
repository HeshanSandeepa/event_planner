import 'package:event_planner/src/features/events/domain/repositories/post_repository.dart';

import '../../data/models/post_model.dart';

class GetPostUseCase {
  final PostRepository repository;

  GetPostUseCase({required this.repository});

  Future<List<PostModel>> execute() async {
    return await repository.getPosts();
  }
}
