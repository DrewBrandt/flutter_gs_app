// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_computer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightComputerModel {

//Rocket State
 Vector3 get position; Vector3 get velocity; Vector3 get acceleration; Vector4 get orientation; int get stage;//metadata
 double get batteryLevel; double get RSSI; int get id; String get name; double get temperature; bool get hasGPSLock; String get flightName;
/// Create a copy of FlightComputerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightComputerModelCopyWith<FlightComputerModel> get copyWith => _$FlightComputerModelCopyWithImpl<FlightComputerModel>(this as FlightComputerModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightComputerModel&&(identical(other.position, position) || other.position == position)&&(identical(other.velocity, velocity) || other.velocity == velocity)&&(identical(other.acceleration, acceleration) || other.acceleration == acceleration)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.RSSI, RSSI) || other.RSSI == RSSI)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.hasGPSLock, hasGPSLock) || other.hasGPSLock == hasGPSLock)&&(identical(other.flightName, flightName) || other.flightName == flightName));
}


@override
int get hashCode => Object.hash(runtimeType,position,velocity,acceleration,orientation,stage,batteryLevel,RSSI,id,name,temperature,hasGPSLock,flightName);

@override
String toString() {
  return 'FlightComputerModel(position: $position, velocity: $velocity, acceleration: $acceleration, orientation: $orientation, stage: $stage, batteryLevel: $batteryLevel, RSSI: $RSSI, id: $id, name: $name, temperature: $temperature, hasGPSLock: $hasGPSLock, flightName: $flightName)';
}


}

/// @nodoc
abstract mixin class $FlightComputerModelCopyWith<$Res>  {
  factory $FlightComputerModelCopyWith(FlightComputerModel value, $Res Function(FlightComputerModel) _then) = _$FlightComputerModelCopyWithImpl;
@useResult
$Res call({
 Vector3 position, Vector3 velocity, Vector3 acceleration, Vector4 orientation, int stage, double batteryLevel, double RSSI, int id, String name, double temperature, bool hasGPSLock, String flightName
});




}
/// @nodoc
class _$FlightComputerModelCopyWithImpl<$Res>
    implements $FlightComputerModelCopyWith<$Res> {
  _$FlightComputerModelCopyWithImpl(this._self, this._then);

  final FlightComputerModel _self;
  final $Res Function(FlightComputerModel) _then;

/// Create a copy of FlightComputerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? velocity = null,Object? acceleration = null,Object? orientation = null,Object? stage = null,Object? batteryLevel = null,Object? RSSI = null,Object? id = null,Object? name = null,Object? temperature = null,Object? hasGPSLock = null,Object? flightName = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Vector3,velocity: null == velocity ? _self.velocity : velocity // ignore: cast_nullable_to_non_nullable
as Vector3,acceleration: null == acceleration ? _self.acceleration : acceleration // ignore: cast_nullable_to_non_nullable
as Vector3,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as Vector4,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as int,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,RSSI: null == RSSI ? _self.RSSI : RSSI // ignore: cast_nullable_to_non_nullable
as double,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,hasGPSLock: null == hasGPSLock ? _self.hasGPSLock : hasGPSLock // ignore: cast_nullable_to_non_nullable
as bool,flightName: null == flightName ? _self.flightName : flightName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _FlightComputerModel implements FlightComputerModel {
  const _FlightComputerModel({required this.position, required this.velocity, required this.acceleration, required this.orientation, required this.stage, required this.batteryLevel, required this.RSSI, required this.id, required this.name, required this.temperature, required this.hasGPSLock, required this.flightName});
  

//Rocket State
@override final  Vector3 position;
@override final  Vector3 velocity;
@override final  Vector3 acceleration;
@override final  Vector4 orientation;
@override final  int stage;
//metadata
@override final  double batteryLevel;
@override final  double RSSI;
@override final  int id;
@override final  String name;
@override final  double temperature;
@override final  bool hasGPSLock;
@override final  String flightName;

/// Create a copy of FlightComputerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightComputerModelCopyWith<_FlightComputerModel> get copyWith => __$FlightComputerModelCopyWithImpl<_FlightComputerModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightComputerModel&&(identical(other.position, position) || other.position == position)&&(identical(other.velocity, velocity) || other.velocity == velocity)&&(identical(other.acceleration, acceleration) || other.acceleration == acceleration)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.RSSI, RSSI) || other.RSSI == RSSI)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.hasGPSLock, hasGPSLock) || other.hasGPSLock == hasGPSLock)&&(identical(other.flightName, flightName) || other.flightName == flightName));
}


@override
int get hashCode => Object.hash(runtimeType,position,velocity,acceleration,orientation,stage,batteryLevel,RSSI,id,name,temperature,hasGPSLock,flightName);

@override
String toString() {
  return 'FlightComputerModel(position: $position, velocity: $velocity, acceleration: $acceleration, orientation: $orientation, stage: $stage, batteryLevel: $batteryLevel, RSSI: $RSSI, id: $id, name: $name, temperature: $temperature, hasGPSLock: $hasGPSLock, flightName: $flightName)';
}


}

/// @nodoc
abstract mixin class _$FlightComputerModelCopyWith<$Res> implements $FlightComputerModelCopyWith<$Res> {
  factory _$FlightComputerModelCopyWith(_FlightComputerModel value, $Res Function(_FlightComputerModel) _then) = __$FlightComputerModelCopyWithImpl;
@override @useResult
$Res call({
 Vector3 position, Vector3 velocity, Vector3 acceleration, Vector4 orientation, int stage, double batteryLevel, double RSSI, int id, String name, double temperature, bool hasGPSLock, String flightName
});




}
/// @nodoc
class __$FlightComputerModelCopyWithImpl<$Res>
    implements _$FlightComputerModelCopyWith<$Res> {
  __$FlightComputerModelCopyWithImpl(this._self, this._then);

  final _FlightComputerModel _self;
  final $Res Function(_FlightComputerModel) _then;

/// Create a copy of FlightComputerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? velocity = null,Object? acceleration = null,Object? orientation = null,Object? stage = null,Object? batteryLevel = null,Object? RSSI = null,Object? id = null,Object? name = null,Object? temperature = null,Object? hasGPSLock = null,Object? flightName = null,}) {
  return _then(_FlightComputerModel(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Vector3,velocity: null == velocity ? _self.velocity : velocity // ignore: cast_nullable_to_non_nullable
as Vector3,acceleration: null == acceleration ? _self.acceleration : acceleration // ignore: cast_nullable_to_non_nullable
as Vector3,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as Vector4,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as int,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,RSSI: null == RSSI ? _self.RSSI : RSSI // ignore: cast_nullable_to_non_nullable
as double,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,hasGPSLock: null == hasGPSLock ? _self.hasGPSLock : hasGPSLock // ignore: cast_nullable_to_non_nullable
as bool,flightName: null == flightName ? _self.flightName : flightName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
