import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_planner/src/features/events/domain/usecases/get_comment_usecase.dart';

import '../../data/models/comment_model.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentUseCase getCommentUseCase;

  CommentBloc({required this.getCommentUseCase}) : super(CommentInitial()) {
    on<FetchCommentsEvent>(_onLoadComments);
  }

  Future<void> _onLoadComments(
    FetchCommentsEvent event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoading());
    try {
      final result = await getCommentUseCase.execute(event.postId);
      emit(CommentFetched(comments: result));
    } catch (error) {
      emit(CommentError(message: error.toString()));
    }
  }
}
