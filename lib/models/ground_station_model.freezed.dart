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

 Map<FlightComputerModel, Relationship> get knownFCs; DeviceData get data;
/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroundStationModelCopyWith<GroundStationModel> get copyWith => _$GroundStationModelCopyWithImpl<GroundStationModel>(this as GroundStationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroundStationModel&&const DeepCollectionEquality().equals(other.knownFCs, knownFCs)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(knownFCs),data);

@override
String toString() {
  return 'GroundStationModel(knownFCs: $knownFCs, data: $data)';
}


}

/// @nodoc
abstract mixin class $GroundStationModelCopyWith<$Res>  {
  factory $GroundStationModelCopyWith(GroundStationModel value, $Res Function(GroundStationModel) _then) = _$GroundStationModelCopyWithImpl;
@useResult
$Res call({
 Map<FlightComputerModel, Relationship> knownFCs, DeviceData data
});


$DeviceDataCopyWith<$Res> get data;

}
/// @nodoc
class _$GroundStationModelCopyWithImpl<$Res>
    implements $GroundStationModelCopyWith<$Res> {
  _$GroundStationModelCopyWithImpl(this._self, this._then);

  final GroundStationModel _self;
  final $Res Function(GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? knownFCs = null,Object? data = null,}) {
  return _then(_self.copyWith(
knownFCs: null == knownFCs ? _self.knownFCs : knownFCs // ignore: cast_nullable_to_non_nullable
as Map<FlightComputerModel, Relationship>,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeviceData,
  ));
}
/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceDataCopyWith<$Res> get data {
  
  return $DeviceDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc


class _GroundStationModel implements GroundStationModel {
  const _GroundStationModel({required final  Map<FlightComputerModel, Relationship> knownFCs, required this.data}): _knownFCs = knownFCs;
  

 final  Map<FlightComputerModel, Relationship> _knownFCs;
@override Map<FlightComputerModel, Relationship> get knownFCs {
  if (_knownFCs is EqualUnmodifiableMapView) return _knownFCs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_knownFCs);
}

@override final  DeviceData data;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroundStationModelCopyWith<_GroundStationModel> get copyWith => __$GroundStationModelCopyWithImpl<_GroundStationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroundStationModel&&const DeepCollectionEquality().equals(other._knownFCs, _knownFCs)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_knownFCs),data);

@override
String toString() {
  return 'GroundStationModel(knownFCs: $knownFCs, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GroundStationModelCopyWith<$Res> implements $GroundStationModelCopyWith<$Res> {
  factory _$GroundStationModelCopyWith(_GroundStationModel value, $Res Function(_GroundStationModel) _then) = __$GroundStationModelCopyWithImpl;
@override @useResult
$Res call({
 Map<FlightComputerModel, Relationship> knownFCs, DeviceData data
});


@override $DeviceDataCopyWith<$Res> get data;

}
/// @nodoc
class __$GroundStationModelCopyWithImpl<$Res>
    implements _$GroundStationModelCopyWith<$Res> {
  __$GroundStationModelCopyWithImpl(this._self, this._then);

  final _GroundStationModel _self;
  final $Res Function(_GroundStationModel) _then;

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? knownFCs = null,Object? data = null,}) {
  return _then(_GroundStationModel(
knownFCs: null == knownFCs ? _self._knownFCs : knownFCs // ignore: cast_nullable_to_non_nullable
as Map<FlightComputerModel, Relationship>,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeviceData,
  ));
}

/// Create a copy of GroundStationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceDataCopyWith<$Res> get data {
  
  return $DeviceDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
