import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_planner/src/features/events/data/models/post_model.dart';
import 'package:event_planner/src/features/events/domain/usecases/get_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostUseCase getPostUseCase;

  PostBloc({required this.getPostUseCase}) : super(PostInitial()) {
    on<FetchPostsEvent>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(
    FetchPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());
    try {
      final result = await getPostUseCase.execute();
      emit(PostsFetched(posts: result));
    } catch (error) {
      emit(PostsError(message: error.toString()));
    }
  }
}
