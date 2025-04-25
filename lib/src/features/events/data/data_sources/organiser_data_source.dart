import 'package:event_planner/src/features/events/data/models/organiser_model.dart';

abstract class OrganiserDataSource {
  Future<List<OrganiserModel>> fetchOrganisers();
}
