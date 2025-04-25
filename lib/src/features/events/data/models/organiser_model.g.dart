// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organiser_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganiserModelImpl _$$OrganiserModelImplFromJson(Map<String, dynamic> json) =>
    _$OrganiserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      organiserName: json['organiserName'] as String? ?? '',
      email: json['email'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrganiserModelImplToJson(
        _$OrganiserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organiserName': instance.organiserName,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };
