// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileModel {

 String get name; int get size; DateTime get date;
/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileModelCopyWith<FileModel> get copyWith => _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,name,size,date);

@override
String toString() {
  return 'FileModel(name: $name, size: $size, date: $date)';
}


}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res>  {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) = _$FileModelCopyWithImpl;
@useResult
$Res call({
 String name, int size, DateTime date
});




}
/// @nodoc
class _$FileModelCopyWithImpl<$Res>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? size = null,Object? date = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _FileModel implements FileModel {
  const _FileModel({required this.name, required this.size, required this.date});
  

@override final  String name;
@override final  int size;
@override final  DateTime date;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileModelCopyWith<_FileModel> get copyWith => __$FileModelCopyWithImpl<_FileModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,name,size,date);

@override
String toString() {
  return 'FileModel(name: $name, size: $size, date: $date)';
}


}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(_FileModel value, $Res Function(_FileModel) _then) = __$FileModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int size, DateTime date
});




}
/// @nodoc
class __$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

/// Create a copy of FileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? size = null,Object? date = null,}) {
  return _then(_FileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$LocalFileModel {

 FileModel get fileInfo; RemoteFileModel? get remoteVersion;
/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalFileModelCopyWith<LocalFileModel> get copyWith => _$LocalFileModelCopyWithImpl<LocalFileModel>(this as LocalFileModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalFileModel&&(identical(other.fileInfo, fileInfo) || other.fileInfo == fileInfo)&&(identical(other.remoteVersion, remoteVersion) || other.remoteVersion == remoteVersion));
}


@override
int get hashCode => Object.hash(runtimeType,fileInfo,remoteVersion);

@override
String toString() {
  return 'LocalFileModel(fileInfo: $fileInfo, remoteVersion: $remoteVersion)';
}


}

/// @nodoc
abstract mixin class $LocalFileModelCopyWith<$Res>  {
  factory $LocalFileModelCopyWith(LocalFileModel value, $Res Function(LocalFileModel) _then) = _$LocalFileModelCopyWithImpl;
@useResult
$Res call({
 FileModel fileInfo, RemoteFileModel? remoteVersion
});


$FileModelCopyWith<$Res> get fileInfo;$RemoteFileModelCopyWith<$Res>? get remoteVersion;

}
/// @nodoc
class _$LocalFileModelCopyWithImpl<$Res>
    implements $LocalFileModelCopyWith<$Res> {
  _$LocalFileModelCopyWithImpl(this._self, this._then);

  final LocalFileModel _self;
  final $Res Function(LocalFileModel) _then;

/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileInfo = null,Object? remoteVersion = freezed,}) {
  return _then(_self.copyWith(
fileInfo: null == fileInfo ? _self.fileInfo : fileInfo // ignore: cast_nullable_to_non_nullable
as FileModel,remoteVersion: freezed == remoteVersion ? _self.remoteVersion : remoteVersion // ignore: cast_nullable_to_non_nullable
as RemoteFileModel?,
  ));
}
/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res> get fileInfo {
  
  return $FileModelCopyWith<$Res>(_self.fileInfo, (value) {
    return _then(_self.copyWith(fileInfo: value));
  });
}/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteFileModelCopyWith<$Res>? get remoteVersion {
    if (_self.remoteVersion == null) {
    return null;
  }

  return $RemoteFileModelCopyWith<$Res>(_self.remoteVersion!, (value) {
    return _then(_self.copyWith(remoteVersion: value));
  });
}
}


/// @nodoc


class _LocalFileModel implements LocalFileModel {
  const _LocalFileModel({required this.fileInfo, required this.remoteVersion});
  

@override final  FileModel fileInfo;
@override final  RemoteFileModel? remoteVersion;

/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalFileModelCopyWith<_LocalFileModel> get copyWith => __$LocalFileModelCopyWithImpl<_LocalFileModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalFileModel&&(identical(other.fileInfo, fileInfo) || other.fileInfo == fileInfo)&&(identical(other.remoteVersion, remoteVersion) || other.remoteVersion == remoteVersion));
}


@override
int get hashCode => Object.hash(runtimeType,fileInfo,remoteVersion);

@override
String toString() {
  return 'LocalFileModel(fileInfo: $fileInfo, remoteVersion: $remoteVersion)';
}


}

/// @nodoc
abstract mixin class _$LocalFileModelCopyWith<$Res> implements $LocalFileModelCopyWith<$Res> {
  factory _$LocalFileModelCopyWith(_LocalFileModel value, $Res Function(_LocalFileModel) _then) = __$LocalFileModelCopyWithImpl;
@override @useResult
$Res call({
 FileModel fileInfo, RemoteFileModel? remoteVersion
});


@override $FileModelCopyWith<$Res> get fileInfo;@override $RemoteFileModelCopyWith<$Res>? get remoteVersion;

}
/// @nodoc
class __$LocalFileModelCopyWithImpl<$Res>
    implements _$LocalFileModelCopyWith<$Res> {
  __$LocalFileModelCopyWithImpl(this._self, this._then);

  final _LocalFileModel _self;
  final $Res Function(_LocalFileModel) _then;

/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileInfo = null,Object? remoteVersion = freezed,}) {
  return _then(_LocalFileModel(
fileInfo: null == fileInfo ? _self.fileInfo : fileInfo // ignore: cast_nullable_to_non_nullable
as FileModel,remoteVersion: freezed == remoteVersion ? _self.remoteVersion : remoteVersion // ignore: cast_nullable_to_non_nullable
as RemoteFileModel?,
  ));
}

/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res> get fileInfo {
  
  return $FileModelCopyWith<$Res>(_self.fileInfo, (value) {
    return _then(_self.copyWith(fileInfo: value));
  });
}/// Create a copy of LocalFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteFileModelCopyWith<$Res>? get remoteVersion {
    if (_self.remoteVersion == null) {
    return null;
  }

  return $RemoteFileModelCopyWith<$Res>(_self.remoteVersion!, (value) {
    return _then(_self.copyWith(remoteVersion: value));
  });
}
}

/// @nodoc
mixin _$RemoteFileModel {

 FileModel get fileInfo; LocalFileModel? get localVersion;
/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteFileModelCopyWith<RemoteFileModel> get copyWith => _$RemoteFileModelCopyWithImpl<RemoteFileModel>(this as RemoteFileModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteFileModel&&(identical(other.fileInfo, fileInfo) || other.fileInfo == fileInfo)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion));
}


@override
int get hashCode => Object.hash(runtimeType,fileInfo,localVersion);

@override
String toString() {
  return 'RemoteFileModel(fileInfo: $fileInfo, localVersion: $localVersion)';
}


}

/// @nodoc
abstract mixin class $RemoteFileModelCopyWith<$Res>  {
  factory $RemoteFileModelCopyWith(RemoteFileModel value, $Res Function(RemoteFileModel) _then) = _$RemoteFileModelCopyWithImpl;
@useResult
$Res call({
 FileModel fileInfo, LocalFileModel? localVersion
});


$FileModelCopyWith<$Res> get fileInfo;$LocalFileModelCopyWith<$Res>? get localVersion;

}
/// @nodoc
class _$RemoteFileModelCopyWithImpl<$Res>
    implements $RemoteFileModelCopyWith<$Res> {
  _$RemoteFileModelCopyWithImpl(this._self, this._then);

  final RemoteFileModel _self;
  final $Res Function(RemoteFileModel) _then;

/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileInfo = null,Object? localVersion = freezed,}) {
  return _then(_self.copyWith(
fileInfo: null == fileInfo ? _self.fileInfo : fileInfo // ignore: cast_nullable_to_non_nullable
as FileModel,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as LocalFileModel?,
  ));
}
/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res> get fileInfo {
  
  return $FileModelCopyWith<$Res>(_self.fileInfo, (value) {
    return _then(_self.copyWith(fileInfo: value));
  });
}/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalFileModelCopyWith<$Res>? get localVersion {
    if (_self.localVersion == null) {
    return null;
  }

  return $LocalFileModelCopyWith<$Res>(_self.localVersion!, (value) {
    return _then(_self.copyWith(localVersion: value));
  });
}
}


/// @nodoc


class _RemoteFileModel implements RemoteFileModel {
  const _RemoteFileModel({required this.fileInfo, required this.localVersion});
  

@override final  FileModel fileInfo;
@override final  LocalFileModel? localVersion;

/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteFileModelCopyWith<_RemoteFileModel> get copyWith => __$RemoteFileModelCopyWithImpl<_RemoteFileModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteFileModel&&(identical(other.fileInfo, fileInfo) || other.fileInfo == fileInfo)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion));
}


@override
int get hashCode => Object.hash(runtimeType,fileInfo,localVersion);

@override
String toString() {
  return 'RemoteFileModel(fileInfo: $fileInfo, localVersion: $localVersion)';
}


}

/// @nodoc
abstract mixin class _$RemoteFileModelCopyWith<$Res> implements $RemoteFileModelCopyWith<$Res> {
  factory _$RemoteFileModelCopyWith(_RemoteFileModel value, $Res Function(_RemoteFileModel) _then) = __$RemoteFileModelCopyWithImpl;
@override @useResult
$Res call({
 FileModel fileInfo, LocalFileModel? localVersion
});


@override $FileModelCopyWith<$Res> get fileInfo;@override $LocalFileModelCopyWith<$Res>? get localVersion;

}
/// @nodoc
class __$RemoteFileModelCopyWithImpl<$Res>
    implements _$RemoteFileModelCopyWith<$Res> {
  __$RemoteFileModelCopyWithImpl(this._self, this._then);

  final _RemoteFileModel _self;
  final $Res Function(_RemoteFileModel) _then;

/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileInfo = null,Object? localVersion = freezed,}) {
  return _then(_RemoteFileModel(
fileInfo: null == fileInfo ? _self.fileInfo : fileInfo // ignore: cast_nullable_to_non_nullable
as FileModel,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as LocalFileModel?,
  ));
}

/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileModelCopyWith<$Res> get fileInfo {
  
  return $FileModelCopyWith<$Res>(_self.fileInfo, (value) {
    return _then(_self.copyWith(fileInfo: value));
  });
}/// Create a copy of RemoteFileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalFileModelCopyWith<$Res>? get localVersion {
    if (_self.localVersion == null) {
    return null;
  }

  return $LocalFileModelCopyWith<$Res>(_self.localVersion!, (value) {
    return _then(_self.copyWith(localVersion: value));
  });
}
}

// dart format on
