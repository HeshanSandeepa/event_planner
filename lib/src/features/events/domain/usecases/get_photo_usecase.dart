import '../../data/models/photo_model.dart';
import '../repositories/photo_repository.dart';

class GetPhotosUseCase {
  final PhotoRepository repository;

  GetPhotosUseCase({required this.repository});

  Future<List<PhotoModel>> execute() async {
    return await repository.getPhotos();
  }
}
