import '../../domain/repositories/photo_repository.dart';
import '../data_sources/photo_data_source.dart';
import '../models/photo_model.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PhotoModel>> getPhotos() async {
    return await remoteDataSource.fetchPhotos();
  }
}
