import 'package:event_planner/src/features/events/data/models/organiser_model.dart';
import 'package:event_planner/src/core/network/net.dart';

import 'organiser_data_source.dart';

class OrganiserDataSourceImpl implements OrganiserDataSource {
  final DioClient dioClient;

  OrganiserDataSourceImpl({required this.dioClient});

  @override
  Future<List<OrganiserModel>> fetchOrganisers() async {
    try {
      final response = await dioClient.dio().get(EndPoint.users.getApi);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<OrganiserModel> organisers =
            jsonList.map((json) => OrganiserModel.fromJson(json)).toList();
        return organisers;
      } else {
        throw const GenericException(message: 'fetchOrganisers error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
