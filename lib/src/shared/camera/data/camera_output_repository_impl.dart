import 'package:image_picker/image_picker.dart';
import '../domain/camera_output_repository.dart';

class CameraOutputRepositoryImpl implements CameraOutputRepository {
  @override
  Future<String> takePicture() async {
    try {
      final file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      if (file == null) {
        throw Exception();
      }
      return file.path;
    } catch (e) {
      rethrow;
    }
  }
}
