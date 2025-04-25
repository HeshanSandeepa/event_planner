part of 'organiser_bloc.dart';

@immutable
sealed class OrganiserEvent {}

class FetchOrganiserEvent extends OrganiserEvent {}