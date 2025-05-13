// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ground_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroundStationModel {
  double get RSSI => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  FlightComputerModel? get connectedFC => throw _privateConstructorUsedError;
  double get batteryLevel => throw _privateConstructorUsedError;

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroundStationModelCopyWith<GroundStationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroundStationModelCopyWith<$Res> {
  factory $GroundStationModelCopyWith(
          GroundStationModel value, $Res Function(GroundStationModel) then) =
      _$GroundStationModelCopyWithImpl<$Res, GroundStationModel>;
  @useResult
  $Res call(
      {double RSSI,
      int id,
      String name,
      FlightComputerModel? connectedFC,
      double batteryLevel});

  $FlightComputerModelCopyWith<$Res>? get connectedFC;
}

/// @nodoc
class _$GroundStationModelCopyWithImpl<$Res, $Val extends GroundStationModel>
    implements $GroundStationModelCopyWith<$Res> {
  _$GroundStationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? RSSI = null,
    Object? id = null,
    Object? name = null,
    Object? connectedFC = freezed,
    Object? batteryLevel = null,
  }) {
    return _then(_value.copyWith(
      RSSI: null == RSSI
          ? _value.RSSI
          : RSSI // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      connectedFC: freezed == connectedFC
          ? _value.connectedFC
          : connectedFC // ignore: cast_nullable_to_non_nullable
              as FlightComputerModel?,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlightComputerModelCopyWith<$Res>? get connectedFC {
    if (_value.connectedFC == null) {
      return null;
    }

    return $FlightComputerModelCopyWith<$Res>(_value.connectedFC!, (value) {
      return _then(_value.copyWith(connectedFC: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroundStationModelImplCopyWith<$Res>
    implements $GroundStationModelCopyWith<$Res> {
  factory _$$GroundStationModelImplCopyWith(_$GroundStationModelImpl value,
          $Res Function(_$GroundStationModelImpl) then) =
      __$$GroundStationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double RSSI,
      int id,
      String name,
      FlightComputerModel? connectedFC,
      double batteryLevel});

  @override
  $FlightComputerModelCopyWith<$Res>? get connectedFC;
}

/// @nodoc
class __$$GroundStationModelImplCopyWithImpl<$Res>
    extends _$GroundStationModelCopyWithImpl<$Res, _$GroundStationModelImpl>
    implements _$$GroundStationModelImplCopyWith<$Res> {
  __$$GroundStationModelImplCopyWithImpl(_$GroundStationModelImpl _value,
      $Res Function(_$GroundStationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? RSSI = null,
    Object? id = null,
    Object? name = null,
    Object? connectedFC = freezed,
    Object? batteryLevel = null,
  }) {
    return _then(_$GroundStationModelImpl(
      RSSI: null == RSSI
          ? _value.RSSI
          : RSSI // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      connectedFC: freezed == connectedFC
          ? _value.connectedFC
          : connectedFC // ignore: cast_nullable_to_non_nullable
              as FlightComputerModel?,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GroundStationModelImpl implements _GroundStationModel {
  const _$GroundStationModelImpl(
      {required this.RSSI,
      required this.id,
      required this.name,
      required this.connectedFC,
      required this.batteryLevel});

  @override
  final double RSSI;
  @override
  final int id;
  @override
  final String name;
  @override
  final FlightComputerModel? connectedFC;
  @override
  final double batteryLevel;

  @override
  String toString() {
    return 'GroundStationModel(RSSI: $RSSI, id: $id, name: $name, connectedFC: $connectedFC, batteryLevel: $batteryLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroundStationModelImpl &&
            (identical(other.RSSI, RSSI) || other.RSSI == RSSI) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.connectedFC, connectedFC) ||
                other.connectedFC == connectedFC) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, RSSI, id, name, connectedFC, batteryLevel);

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroundStationModelImplCopyWith<_$GroundStationModelImpl> get copyWith =>
      __$$GroundStationModelImplCopyWithImpl<_$GroundStationModelImpl>(
          this, _$identity);
}

abstract class _GroundStationModel implements GroundStationModel {
  const factory _GroundStationModel(
      {required final double RSSI,
      required final int id,
      required final String name,
      required final FlightComputerModel? connectedFC,
      required final double batteryLevel}) = _$GroundStationModelImpl;

  @override
  double get RSSI;
  @override
  int get id;
  @override
  String get name;
  @override
  FlightComputerModel? get connectedFC;
  @override
  double get batteryLevel;

  /// Create a copy of GroundStationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroundStationModelImplCopyWith<_$GroundStationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
