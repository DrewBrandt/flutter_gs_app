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

 double get RSSI; int get id; String get name; FlightComputerModel? get connectedFC; double get batteryLevel;
/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroundStationModelCopyWith<GroundStationModel> get copyWith => _$GroundStationModelCopyWithImpl<GroundStationModel>(this as GroundStationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroundStationModel&&(identical(other.RSSI, RSSI) || other.RSSI == RSSI)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.connectedFC, connectedFC) || other.connectedFC == connectedFC)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}


@override
int get hashCode => Object.hash(runtimeType,RSSI,id,name,connectedFC,batteryLevel);

@override
String toString() {
  return 'GroundStationModel(RSSI: $RSSI, id: $id, name: $name, connectedFC: $connectedFC, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class $GroundStationModelCopyWith<$Res>  {
  factory $GroundStationModelCopyWith(GroundStationModel value, $Res Function(GroundStationModel) _then) = _$GroundStationModelCopyWithImpl;
@useResult
$Res call({
 double RSSI, int id, String name, FlightComputerModel? connectedFC, double batteryLevel
});


$FlightComputerModelCopyWith<$Res>? get connectedFC;

}
/// @nodoc
class _$GroundStationModelCopyWithImpl<$Res>
    implements $GroundStationModelCopyWith<$Res> {
  _$GroundStationModelCopyWithImpl(this._self, this._then);

  final GroundStationModel _self;
  final $Res Function(GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? RSSI = null,Object? id = null,Object? name = null,Object? connectedFC = freezed,Object? batteryLevel = null,}) {
  return _then(_self.copyWith(
RSSI: null == RSSI ? _self.RSSI : RSSI // ignore: cast_nullable_to_non_nullable
as double,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,connectedFC: freezed == connectedFC ? _self.connectedFC : connectedFC // ignore: cast_nullable_to_non_nullable
as FlightComputerModel?,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightComputerModelCopyWith<$Res>? get connectedFC {
    if (_self.connectedFC == null) {
    return null;
  }

  return $FlightComputerModelCopyWith<$Res>(_self.connectedFC!, (value) {
    return _then(_self.copyWith(connectedFC: value));
  });
}
}


/// @nodoc


class _GroundStationModel implements GroundStationModel {
  const _GroundStationModel({required this.RSSI, required this.id, required this.name, required this.connectedFC, required this.batteryLevel});
  

@override final  double RSSI;
@override final  int id;
@override final  String name;
@override final  FlightComputerModel? connectedFC;
@override final  double batteryLevel;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroundStationModelCopyWith<_GroundStationModel> get copyWith => __$GroundStationModelCopyWithImpl<_GroundStationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroundStationModel&&(identical(other.RSSI, RSSI) || other.RSSI == RSSI)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.connectedFC, connectedFC) || other.connectedFC == connectedFC)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}


@override
int get hashCode => Object.hash(runtimeType,RSSI,id,name,connectedFC,batteryLevel);

@override
String toString() {
  return 'GroundStationModel(RSSI: $RSSI, id: $id, name: $name, connectedFC: $connectedFC, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class _$GroundStationModelCopyWith<$Res> implements $GroundStationModelCopyWith<$Res> {
  factory _$GroundStationModelCopyWith(_GroundStationModel value, $Res Function(_GroundStationModel) _then) = __$GroundStationModelCopyWithImpl;
@override @useResult
$Res call({
 double RSSI, int id, String name, FlightComputerModel? connectedFC, double batteryLevel
});


@override $FlightComputerModelCopyWith<$Res>? get connectedFC;

}
/// @nodoc
class __$GroundStationModelCopyWithImpl<$Res>
    implements _$GroundStationModelCopyWith<$Res> {
  __$GroundStationModelCopyWithImpl(this._self, this._then);

  final _GroundStationModel _self;
  final $Res Function(_GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? RSSI = null,Object? id = null,Object? name = null,Object? connectedFC = freezed,Object? batteryLevel = null,}) {
  return _then(_GroundStationModel(
RSSI: null == RSSI ? _self.RSSI : RSSI // ignore: cast_nullable_to_non_nullable
as double,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,connectedFC: freezed == connectedFC ? _self.connectedFC : connectedFC // ignore: cast_nullable_to_non_nullable
as FlightComputerModel?,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightComputerModelCopyWith<$Res>? get connectedFC {
    if (_self.connectedFC == null) {
    return null;
  }

  return $FlightComputerModelCopyWith<$Res>(_self.connectedFC!, (value) {
    return _then(_self.copyWith(connectedFC: value));
  });
}
}

// dart format on
