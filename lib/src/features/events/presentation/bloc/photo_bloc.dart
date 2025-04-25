import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/photo_model.dart';
import '../../domain/usecases/get_photo_usecase.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotosUseCase getPhotosUseCase;

  PhotoBloc({required this.getPhotosUseCase}) : super(PhotoInitial()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(
    FetchPhotosEvent event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotoLoading());
    try {
      final result = await getPhotosUseCase.execute();
      emit(PhotoFetched(photos: result));
    } catch (error) {
      emit(PhotoError(message: error.toString()));
    }
  }
}
