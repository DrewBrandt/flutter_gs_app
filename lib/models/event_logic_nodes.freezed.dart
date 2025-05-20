// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_logic_nodes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventLogicNode {

 String get name; int get id; double get batteryLevel; ConStatus get conStatus; Color? get color; String get firmwareVer; DeviceType get type; int get rssi;
/// Create a copy of EventLogicNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventLogicNodeCopyWith<EventLogicNode> get copyWith => _$EventLogicNodeCopyWithImpl<EventLogicNode>(this as EventLogicNode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventLogicNode&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.conStatus, conStatus) || other.conStatus == conStatus)&&(identical(other.color, color) || other.color == color)&&(identical(other.firmwareVer, firmwareVer) || other.firmwareVer == firmwareVer)&&(identical(other.type, type) || other.type == type)&&(identical(other.rssi, rssi) || other.rssi == rssi));
}


@override
int get hashCode => Object.hash(runtimeType,name,id,batteryLevel,conStatus,color,firmwareVer,type,rssi);

@override
String toString() {
  return 'EventLogicNode(name: $name, id: $id, batteryLevel: $batteryLevel, conStatus: $conStatus, color: $color, firmwareVer: $firmwareVer, type: $type, rssi: $rssi)';
}


}

/// @nodoc
abstract mixin class $EventLogicNodeCopyWith<$Res>  {
  factory $EventLogicNodeCopyWith(EventLogicNode value, $Res Function(EventLogicNode) _then) = _$EventLogicNodeCopyWithImpl;
@useResult
$Res call({
 String name, int id, double batteryLevel, ConStatus conStatus, Color? color, String firmwareVer, DeviceType type, int rssi
});




}
/// @nodoc
class _$EventLogicNodeCopyWithImpl<$Res>
    implements $EventLogicNodeCopyWith<$Res> {
  _$EventLogicNodeCopyWithImpl(this._self, this._then);

  final EventLogicNode _self;
  final $Res Function(EventLogicNode) _then;

/// Create a copy of EventLogicNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = null,Object? batteryLevel = null,Object? conStatus = null,Object? color = freezed,Object? firmwareVer = null,Object? type = null,Object? rssi = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,conStatus: null == conStatus ? _self.conStatus : conStatus // ignore: cast_nullable_to_non_nullable
as ConStatus,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,firmwareVer: null == firmwareVer ? _self.firmwareVer : firmwareVer // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _EventLogicNode implements EventLogicNode {
  const _EventLogicNode({required this.name, required this.id, required this.batteryLevel, required this.conStatus, required this.color, required this.firmwareVer, required this.type, required this.rssi});
  

@override final  String name;
@override final  int id;
@override final  double batteryLevel;
@override final  ConStatus conStatus;
@override final  Color? color;
@override final  String firmwareVer;
@override final  DeviceType type;
@override final  int rssi;

/// Create a copy of EventLogicNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventLogicNodeCopyWith<_EventLogicNode> get copyWith => __$EventLogicNodeCopyWithImpl<_EventLogicNode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLogicNode&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.conStatus, conStatus) || other.conStatus == conStatus)&&(identical(other.color, color) || other.color == color)&&(identical(other.firmwareVer, firmwareVer) || other.firmwareVer == firmwareVer)&&(identical(other.type, type) || other.type == type)&&(identical(other.rssi, rssi) || other.rssi == rssi));
}


@override
int get hashCode => Object.hash(runtimeType,name,id,batteryLevel,conStatus,color,firmwareVer,type,rssi);

@override
String toString() {
  return 'EventLogicNode(name: $name, id: $id, batteryLevel: $batteryLevel, conStatus: $conStatus, color: $color, firmwareVer: $firmwareVer, type: $type, rssi: $rssi)';
}


}

/// @nodoc
abstract mixin class _$EventLogicNodeCopyWith<$Res> implements $EventLogicNodeCopyWith<$Res> {
  factory _$EventLogicNodeCopyWith(_EventLogicNode value, $Res Function(_EventLogicNode) _then) = __$EventLogicNodeCopyWithImpl;
@override @useResult
$Res call({
 String name, int id, double batteryLevel, ConStatus conStatus, Color? color, String firmwareVer, DeviceType type, int rssi
});




}
/// @nodoc
class __$EventLogicNodeCopyWithImpl<$Res>
    implements _$EventLogicNodeCopyWith<$Res> {
  __$EventLogicNodeCopyWithImpl(this._self, this._then);

  final _EventLogicNode _self;
  final $Res Function(_EventLogicNode) _then;

/// Create a copy of EventLogicNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = null,Object? batteryLevel = null,Object? conStatus = null,Object? color = freezed,Object? firmwareVer = null,Object? type = null,Object? rssi = null,}) {
  return _then(_EventLogicNode(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,conStatus: null == conStatus ? _self.conStatus : conStatus // ignore: cast_nullable_to_non_nullable
as ConStatus,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,firmwareVer: null == firmwareVer ? _self.firmwareVer : firmwareVer // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
