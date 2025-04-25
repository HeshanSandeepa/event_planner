import 'package:event_planner/src/features/events/data/models/organiser_model.dart';

abstract class OrganiserRepository {
  Future<List<OrganiserModel>> getOrganisers();
}
