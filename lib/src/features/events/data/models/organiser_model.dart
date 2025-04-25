import 'package:freezed_annotation/freezed_annotation.dart';
import 'address_model.dart';
import 'company_model.dart';

part 'organiser_model.freezed.dart';
part 'organiser_model.g.dart';

@freezed
class OrganiserModel with _$OrganiserModel {
  const OrganiserModel._();

  const factory OrganiserModel({
    required int id,
    required String name,
    @Default('') String organiserName,
    required String email,
    required AddressModel address,
    required String phone,
    required String website,
    required CompanyModel company,
  }) = _OrganiserModel;

  factory OrganiserModel.fromJson(Map<String, dynamic> json) =>
      _$OrganiserModelFromJson(json);
}