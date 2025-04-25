import 'package:event_planner/src/features/events/data/data_sources/photo_data_source.dart';
import 'package:event_planner/src/core/network/net.dart';
import '../../../../core/utils/strings.dart';
import '../models/photo_model.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final DioClient dioClient;

  PhotoDataSourceImpl({required this.dioClient});

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    try {
      final response = await dioClient.dio().get(EndPoint.photos.getApi);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<PhotoModel> photos =
            jsonList.map((json) => PhotoModel.fromJson(json)).toList();
        return photos;
      } else {
        throw const GenericException(message: Strings.errorPhotos);
      }
    } catch (e) {
      rethrow;
    }
  }
}
