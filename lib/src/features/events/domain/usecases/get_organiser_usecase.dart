import 'package:event_planner/src/features/events/data/models/organiser_model.dart';
import 'package:event_planner/src/features/events/domain/repositories/organiser_repository.dart';

class GetOrganiserUseCase {
  final OrganiserRepository repository;

  GetOrganiserUseCase({required this.repository});

  Future<List<OrganiserModel>> execute() async {
    return await repository.getOrganisers();
  }
}
