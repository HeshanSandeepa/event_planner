import 'package:event_planner/src/features/events/data/data_sources/organiser_data_source.dart';
import 'package:event_planner/src/features/events/data/models/organiser_model.dart';
import 'package:event_planner/src/features/events/domain/repositories/organiser_repository.dart';

class OrganiserRepositoryImpl implements OrganiserRepository {
  final OrganiserDataSource remoteDataSource;

  OrganiserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<OrganiserModel>> getOrganisers() async {
    return await remoteDataSource.fetchOrganisers();
  }
}
