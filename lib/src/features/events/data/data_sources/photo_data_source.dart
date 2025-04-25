import '../models/photo_model.dart';

abstract class PhotoDataSource {
  Future<List<PhotoModel>> fetchPhotos();
}
