// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organiser_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganiserModel _$OrganiserModelFromJson(Map<String, dynamic> json) {
  return _OrganiserModel.fromJson(json);
}

/// @nodoc
mixin _$OrganiserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get organiserName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  CompanyModel get company => throw _privateConstructorUsedError;

  /// Serializes this OrganiserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganiserModelCopyWith<OrganiserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganiserModelCopyWith<$Res> {
  factory $OrganiserModelCopyWith(
          OrganiserModel value, $Res Function(OrganiserModel) then) =
      _$OrganiserModelCopyWithImpl<$Res, OrganiserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String organiserName,
      String email,
      AddressModel address,
      String phone,
      String website,
      CompanyModel company});

  $AddressModelCopyWith<$Res> get address;
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class _$OrganiserModelCopyWithImpl<$Res, $Val extends OrganiserModel>
    implements $OrganiserModelCopyWith<$Res> {
  _$OrganiserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? organiserName = null,
    Object? email = null,
    Object? address = null,
    Object? phone = null,
    Object? website = null,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organiserName: null == organiserName
          ? _value.organiserName
          : organiserName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
    ) as $Val);
  }

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get company {
    return $CompanyModelCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrganiserModelImplCopyWith<$Res>
    implements $OrganiserModelCopyWith<$Res> {
  factory _$$OrganiserModelImplCopyWith(_$OrganiserModelImpl value,
          $Res Function(_$OrganiserModelImpl) then) =
      __$$OrganiserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String organiserName,
      String email,
      AddressModel address,
      String phone,
      String website,
      CompanyModel company});

  @override
  $AddressModelCopyWith<$Res> get address;
  @override
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class __$$OrganiserModelImplCopyWithImpl<$Res>
    extends _$OrganiserModelCopyWithImpl<$Res, _$OrganiserModelImpl>
    implements _$$OrganiserModelImplCopyWith<$Res> {
  __$$OrganiserModelImplCopyWithImpl(
      _$OrganiserModelImpl _value, $Res Function(_$OrganiserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? organiserName = null,
    Object? email = null,
    Object? address = null,
    Object? phone = null,
    Object? website = null,
    Object? company = null,
  }) {
    return _then(_$OrganiserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organiserName: null == organiserName
          ? _value.organiserName
          : organiserName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganiserModelImpl extends _OrganiserModel {
  const _$OrganiserModelImpl(
      {required this.id,
      required this.name,
      this.organiserName = '',
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company})
      : super._();

  factory _$OrganiserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganiserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String organiserName;
  @override
  final String email;
  @override
  final AddressModel address;
  @override
  final String phone;
  @override
  final String website;
  @override
  final CompanyModel company;

  @override
  String toString() {
    return 'OrganiserModel(id: $id, name: $name, organiserName: $organiserName, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganiserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organiserName, organiserName) ||
                other.organiserName == organiserName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, organiserName, email,
      address, phone, website, company);

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganiserModelImplCopyWith<_$OrganiserModelImpl> get copyWith =>
      __$$OrganiserModelImplCopyWithImpl<_$OrganiserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganiserModelImplToJson(
      this,
    );
  }
}

abstract class _OrganiserModel extends OrganiserModel {
  const factory _OrganiserModel(
      {required final int id,
      required final String name,
      final String organiserName,
      required final String email,
      required final AddressModel address,
      required final String phone,
      required final String website,
      required final CompanyModel company}) = _$OrganiserModelImpl;
  const _OrganiserModel._() : super._();

  factory _OrganiserModel.fromJson(Map<String, dynamic> json) =
      _$OrganiserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get organiserName;
  @override
  String get email;
  @override
  AddressModel get address;
  @override
  String get phone;
  @override
  String get website;
  @override
  CompanyModel get company;

  /// Create a copy of OrganiserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganiserModelImplCopyWith<_$OrganiserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
