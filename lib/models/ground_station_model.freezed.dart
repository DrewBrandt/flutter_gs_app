// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ground_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroundStationModel {

 int get id; String get name; double get batteryLevel; String get firmwareVersion; bool get conViaUSB; Map<FlightComputerModel, Relationship> get knownFCs; bool get isConnected; Color? get color;
/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroundStationModelCopyWith<GroundStationModel> get copyWith => _$GroundStationModelCopyWithImpl<GroundStationModel>(this as GroundStationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroundStationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.conViaUSB, conViaUSB) || other.conViaUSB == conViaUSB)&&const DeepCollectionEquality().equals(other.knownFCs, knownFCs)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,batteryLevel,firmwareVersion,conViaUSB,const DeepCollectionEquality().hash(knownFCs),isConnected,color);

@override
String toString() {
  return 'GroundStationModel(id: $id, name: $name, batteryLevel: $batteryLevel, firmwareVersion: $firmwareVersion, conViaUSB: $conViaUSB, knownFCs: $knownFCs, isConnected: $isConnected, color: $color)';
}


}

/// @nodoc
abstract mixin class $GroundStationModelCopyWith<$Res>  {
  factory $GroundStationModelCopyWith(GroundStationModel value, $Res Function(GroundStationModel) _then) = _$GroundStationModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, double batteryLevel, String firmwareVersion, bool conViaUSB, Map<FlightComputerModel, Relationship> knownFCs, bool isConnected, Color? color
});




}
/// @nodoc
class _$GroundStationModelCopyWithImpl<$Res>
    implements $GroundStationModelCopyWith<$Res> {
  _$GroundStationModelCopyWithImpl(this._self, this._then);

  final GroundStationModel _self;
  final $Res Function(GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? batteryLevel = null,Object? firmwareVersion = null,Object? conViaUSB = null,Object? knownFCs = null,Object? isConnected = null,Object? color = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,firmwareVersion: null == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as String,conViaUSB: null == conViaUSB ? _self.conViaUSB : conViaUSB // ignore: cast_nullable_to_non_nullable
as bool,knownFCs: null == knownFCs ? _self.knownFCs : knownFCs // ignore: cast_nullable_to_non_nullable
as Map<FlightComputerModel, Relationship>,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// @nodoc


class _GroundStationModel implements GroundStationModel {
  const _GroundStationModel({required this.id, required this.name, required this.batteryLevel, required this.firmwareVersion, required this.conViaUSB, required final  Map<FlightComputerModel, Relationship> knownFCs, required this.isConnected, required this.color}): _knownFCs = knownFCs;
  

@override final  int id;
@override final  String name;
@override final  double batteryLevel;
@override final  String firmwareVersion;
@override final  bool conViaUSB;
 final  Map<FlightComputerModel, Relationship> _knownFCs;
@override Map<FlightComputerModel, Relationship> get knownFCs {
  if (_knownFCs is EqualUnmodifiableMapView) return _knownFCs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_knownFCs);
}

@override final  bool isConnected;
@override final  Color? color;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroundStationModelCopyWith<_GroundStationModel> get copyWith => __$GroundStationModelCopyWithImpl<_GroundStationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroundStationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.firmwareVersion, firmwareVersion) || other.firmwareVersion == firmwareVersion)&&(identical(other.conViaUSB, conViaUSB) || other.conViaUSB == conViaUSB)&&const DeepCollectionEquality().equals(other._knownFCs, _knownFCs)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,batteryLevel,firmwareVersion,conViaUSB,const DeepCollectionEquality().hash(_knownFCs),isConnected,color);

@override
String toString() {
  return 'GroundStationModel(id: $id, name: $name, batteryLevel: $batteryLevel, firmwareVersion: $firmwareVersion, conViaUSB: $conViaUSB, knownFCs: $knownFCs, isConnected: $isConnected, color: $color)';
}


}

/// @nodoc
abstract mixin class _$GroundStationModelCopyWith<$Res> implements $GroundStationModelCopyWith<$Res> {
  factory _$GroundStationModelCopyWith(_GroundStationModel value, $Res Function(_GroundStationModel) _then) = __$GroundStationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double batteryLevel, String firmwareVersion, bool conViaUSB, Map<FlightComputerModel, Relationship> knownFCs, bool isConnected, Color? color
});




}
/// @nodoc
class __$GroundStationModelCopyWithImpl<$Res>
    implements _$GroundStationModelCopyWith<$Res> {
  __$GroundStationModelCopyWithImpl(this._self, this._then);

  final _GroundStationModel _self;
  final $Res Function(_GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? batteryLevel = null,Object? firmwareVersion = null,Object? conViaUSB = null,Object? knownFCs = null,Object? isConnected = null,Object? color = freezed,}) {
  return _then(_GroundStationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,firmwareVersion: null == firmwareVersion ? _self.firmwareVersion : firmwareVersion // ignore: cast_nullable_to_non_nullable
as String,conViaUSB: null == conViaUSB ? _self.conViaUSB : conViaUSB // ignore: cast_nullable_to_non_nullable
as bool,knownFCs: null == knownFCs ? _self._knownFCs : knownFCs // ignore: cast_nullable_to_non_nullable
as Map<FlightComputerModel, Relationship>,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on
