part of 'organiser_bloc.dart';

@immutable
sealed class OrganiserState {}

final class OrganiserInitial extends OrganiserState {}

class OrganiserLoading extends OrganiserState {}

class OrganiserFetched extends OrganiserState {
  final List<OrganiserModel> organisers;

  OrganiserFetched({required this.organisers});
}

class OrganiserError extends OrganiserState {
  final String message;

  OrganiserError({required this.message});
}
