// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_computer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlightComputerModel {
//Rocket State
  Vector3 get position => throw _privateConstructorUsedError;
  Vector3 get velocity => throw _privateConstructorUsedError;
  Vector3 get acceleration => throw _privateConstructorUsedError;
  Vector4 get orientation => throw _privateConstructorUsedError;
  int get stage => throw _privateConstructorUsedError; //metadata
  double get batteryLevel => throw _privateConstructorUsedError;
  double get RSSI => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  bool get hasGPSLock => throw _privateConstructorUsedError;

  /// Create a copy of FlightComputerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightComputerModelCopyWith<FlightComputerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightComputerModelCopyWith<$Res> {
  factory $FlightComputerModelCopyWith(
          FlightComputerModel value, $Res Function(FlightComputerModel) then) =
      _$FlightComputerModelCopyWithImpl<$Res, FlightComputerModel>;
  @useResult
  $Res call(
      {Vector3 position,
      Vector3 velocity,
      Vector3 acceleration,
      Vector4 orientation,
      int stage,
      double batteryLevel,
      double RSSI,
      int id,
      String name,
      double temperature,
      bool hasGPSLock});
}

/// @nodoc
class _$FlightComputerModelCopyWithImpl<$Res, $Val extends FlightComputerModel>
    implements $FlightComputerModelCopyWith<$Res> {
  _$FlightComputerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightComputerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? velocity = null,
    Object? acceleration = null,
    Object? orientation = null,
    Object? stage = null,
    Object? batteryLevel = null,
    Object? RSSI = null,
    Object? id = null,
    Object? name = null,
    Object? temperature = null,
    Object? hasGPSLock = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Vector3,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Vector3,
      acceleration: null == acceleration
          ? _value.acceleration
          : acceleration // ignore: cast_nullable_to_non_nullable
              as Vector3,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Vector4,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
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
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      hasGPSLock: null == hasGPSLock
          ? _value.hasGPSLock
          : hasGPSLock // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightComputerModelImplCopyWith<$Res>
    implements $FlightComputerModelCopyWith<$Res> {
  factory _$$FlightComputerModelImplCopyWith(_$FlightComputerModelImpl value,
          $Res Function(_$FlightComputerModelImpl) then) =
      __$$FlightComputerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Vector3 position,
      Vector3 velocity,
      Vector3 acceleration,
      Vector4 orientation,
      int stage,
      double batteryLevel,
      double RSSI,
      int id,
      String name,
      double temperature,
      bool hasGPSLock});
}

/// @nodoc
class __$$FlightComputerModelImplCopyWithImpl<$Res>
    extends _$FlightComputerModelCopyWithImpl<$Res, _$FlightComputerModelImpl>
    implements _$$FlightComputerModelImplCopyWith<$Res> {
  __$$FlightComputerModelImplCopyWithImpl(_$FlightComputerModelImpl _value,
      $Res Function(_$FlightComputerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlightComputerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? velocity = null,
    Object? acceleration = null,
    Object? orientation = null,
    Object? stage = null,
    Object? batteryLevel = null,
    Object? RSSI = null,
    Object? id = null,
    Object? name = null,
    Object? temperature = null,
    Object? hasGPSLock = null,
  }) {
    return _then(_$FlightComputerModelImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Vector3,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Vector3,
      acceleration: null == acceleration
          ? _value.acceleration
          : acceleration // ignore: cast_nullable_to_non_nullable
              as Vector3,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Vector4,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
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
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      hasGPSLock: null == hasGPSLock
          ? _value.hasGPSLock
          : hasGPSLock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FlightComputerModelImpl implements _FlightComputerModel {
  const _$FlightComputerModelImpl(
      {required this.position,
      required this.velocity,
      required this.acceleration,
      required this.orientation,
      required this.stage,
      required this.batteryLevel,
      required this.RSSI,
      required this.id,
      required this.name,
      required this.temperature,
      required this.hasGPSLock});

//Rocket State
  @override
  final Vector3 position;
  @override
  final Vector3 velocity;
  @override
  final Vector3 acceleration;
  @override
  final Vector4 orientation;
  @override
  final int stage;
//metadata
  @override
  final double batteryLevel;
  @override
  final double RSSI;
  @override
  final int id;
  @override
  final String name;
  @override
  final double temperature;
  @override
  final bool hasGPSLock;

  @override
  String toString() {
    return 'FlightComputerModel(position: $position, velocity: $velocity, acceleration: $acceleration, orientation: $orientation, stage: $stage, batteryLevel: $batteryLevel, RSSI: $RSSI, id: $id, name: $name, temperature: $temperature, hasGPSLock: $hasGPSLock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightComputerModelImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity) &&
            (identical(other.acceleration, acceleration) ||
                other.acceleration == acceleration) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.RSSI, RSSI) || other.RSSI == RSSI) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.hasGPSLock, hasGPSLock) ||
                other.hasGPSLock == hasGPSLock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      position,
      velocity,
      acceleration,
      orientation,
      stage,
      batteryLevel,
      RSSI,
      id,
      name,
      temperature,
      hasGPSLock);

  /// Create a copy of FlightComputerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightComputerModelImplCopyWith<_$FlightComputerModelImpl> get copyWith =>
      __$$FlightComputerModelImplCopyWithImpl<_$FlightComputerModelImpl>(
          this, _$identity);
}

abstract class _FlightComputerModel implements FlightComputerModel {
  const factory _FlightComputerModel(
      {required final Vector3 position,
      required final Vector3 velocity,
      required final Vector3 acceleration,
      required final Vector4 orientation,
      required final int stage,
      required final double batteryLevel,
      required final double RSSI,
      required final int id,
      required final String name,
      required final double temperature,
      required final bool hasGPSLock}) = _$FlightComputerModelImpl;

//Rocket State
  @override
  Vector3 get position;
  @override
  Vector3 get velocity;
  @override
  Vector3 get acceleration;
  @override
  Vector4 get orientation;
  @override
  int get stage; //metadata
  @override
  double get batteryLevel;
  @override
  double get RSSI;
  @override
  int get id;
  @override
  String get name;
  @override
  double get temperature;
  @override
  bool get hasGPSLock;

  /// Create a copy of FlightComputerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightComputerModelImplCopyWith<_$FlightComputerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
