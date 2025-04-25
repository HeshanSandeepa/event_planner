import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_planner/src/features/events/data/models/organiser_model.dart';
import 'package:event_planner/src/features/events/domain/usecases/get_organiser_usecase.dart';

part 'organiser_event.dart';
part 'organiser_state.dart';

class OrganiserBloc extends Bloc<OrganiserEvent, OrganiserState> {
  final GetOrganiserUseCase getOrganiserUseCase;

  OrganiserBloc({required this.getOrganiserUseCase})
    : super(OrganiserInitial()) {
    on<FetchOrganiserEvent>(_onFetchOrganisers);
  }

  Future<void> _onFetchOrganisers(
    FetchOrganiserEvent event,
    Emitter<OrganiserState> emit,
  ) async {
    emit(OrganiserLoading());
    try {
      final result = await getOrganiserUseCase.execute();
      emit(OrganiserFetched(organisers: result));
    } catch (error) {
      emit(OrganiserError(message: error.toString()));
    }
  }
}
