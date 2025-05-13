// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileModel {
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res, FileModel>;
  @useResult
  $Res call({String name, int size, DateTime date});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res, $Val extends FileModel>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileModelImplCopyWith<$Res>
    implements $FileModelCopyWith<$Res> {
  factory _$$FileModelImplCopyWith(
          _$FileModelImpl value, $Res Function(_$FileModelImpl) then) =
      __$$FileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int size, DateTime date});
}

/// @nodoc
class __$$FileModelImplCopyWithImpl<$Res>
    extends _$FileModelCopyWithImpl<$Res, _$FileModelImpl>
    implements _$$FileModelImplCopyWith<$Res> {
  __$$FileModelImplCopyWithImpl(
      _$FileModelImpl _value, $Res Function(_$FileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? date = null,
  }) {
    return _then(_$FileModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FileModelImpl implements _FileModel {
  const _$FileModelImpl(
      {required this.name, required this.size, required this.date});

  @override
  final String name;
  @override
  final int size;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'FileModel(name: $name, size: $size, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, size, date);

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      __$$FileModelImplCopyWithImpl<_$FileModelImpl>(this, _$identity);
}

abstract class _FileModel implements FileModel {
  const factory _FileModel(
      {required final String name,
      required final int size,
      required final DateTime date}) = _$FileModelImpl;

  @override
  String get name;
  @override
  int get size;
  @override
  DateTime get date;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileModelImplCopyWith<_$FileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalFileModel {
  FileModel get fileInfo => throw _privateConstructorUsedError;
  RemoteFileModel? get remoteVersion => throw _privateConstructorUsedError;

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalFileModelCopyWith<LocalFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalFileModelCopyWith<$Res> {
  factory $LocalFileModelCopyWith(
          LocalFileModel value, $Res Function(LocalFileModel) then) =
      _$LocalFileModelCopyWithImpl<$Res, LocalFileModel>;
  @useResult
  $Res call({FileModel fileInfo, RemoteFileModel? remoteVersion});

  $FileModelCopyWith<$Res> get fileInfo;
  $RemoteFileModelCopyWith<$Res>? get remoteVersion;
}

/// @nodoc
class _$LocalFileModelCopyWithImpl<$Res, $Val extends LocalFileModel>
    implements $LocalFileModelCopyWith<$Res> {
  _$LocalFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileInfo = null,
    Object? remoteVersion = freezed,
  }) {
    return _then(_value.copyWith(
      fileInfo: null == fileInfo
          ? _value.fileInfo
          : fileInfo // ignore: cast_nullable_to_non_nullable
              as FileModel,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as RemoteFileModel?,
    ) as $Val);
  }

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get fileInfo {
    return $FileModelCopyWith<$Res>(_value.fileInfo, (value) {
      return _then(_value.copyWith(fileInfo: value) as $Val);
    });
  }

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteFileModelCopyWith<$Res>? get remoteVersion {
    if (_value.remoteVersion == null) {
      return null;
    }

    return $RemoteFileModelCopyWith<$Res>(_value.remoteVersion!, (value) {
      return _then(_value.copyWith(remoteVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalFileModelImplCopyWith<$Res>
    implements $LocalFileModelCopyWith<$Res> {
  factory _$$LocalFileModelImplCopyWith(_$LocalFileModelImpl value,
          $Res Function(_$LocalFileModelImpl) then) =
      __$$LocalFileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FileModel fileInfo, RemoteFileModel? remoteVersion});

  @override
  $FileModelCopyWith<$Res> get fileInfo;
  @override
  $RemoteFileModelCopyWith<$Res>? get remoteVersion;
}

/// @nodoc
class __$$LocalFileModelImplCopyWithImpl<$Res>
    extends _$LocalFileModelCopyWithImpl<$Res, _$LocalFileModelImpl>
    implements _$$LocalFileModelImplCopyWith<$Res> {
  __$$LocalFileModelImplCopyWithImpl(
      _$LocalFileModelImpl _value, $Res Function(_$LocalFileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileInfo = null,
    Object? remoteVersion = freezed,
  }) {
    return _then(_$LocalFileModelImpl(
      fileInfo: null == fileInfo
          ? _value.fileInfo
          : fileInfo // ignore: cast_nullable_to_non_nullable
              as FileModel,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as RemoteFileModel?,
    ));
  }
}

/// @nodoc

class _$LocalFileModelImpl implements _LocalFileModel {
  const _$LocalFileModelImpl(
      {required this.fileInfo, required this.remoteVersion});

  @override
  final FileModel fileInfo;
  @override
  final RemoteFileModel? remoteVersion;

  @override
  String toString() {
    return 'LocalFileModel(fileInfo: $fileInfo, remoteVersion: $remoteVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalFileModelImpl &&
            (identical(other.fileInfo, fileInfo) ||
                other.fileInfo == fileInfo) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileInfo, remoteVersion);

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalFileModelImplCopyWith<_$LocalFileModelImpl> get copyWith =>
      __$$LocalFileModelImplCopyWithImpl<_$LocalFileModelImpl>(
          this, _$identity);
}

abstract class _LocalFileModel implements LocalFileModel {
  const factory _LocalFileModel(
      {required final FileModel fileInfo,
      required final RemoteFileModel? remoteVersion}) = _$LocalFileModelImpl;

  @override
  FileModel get fileInfo;
  @override
  RemoteFileModel? get remoteVersion;

  /// Create a copy of LocalFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalFileModelImplCopyWith<_$LocalFileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RemoteFileModel {
  FileModel get fileInfo => throw _privateConstructorUsedError;
  LocalFileModel? get localVersion => throw _privateConstructorUsedError;

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteFileModelCopyWith<RemoteFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteFileModelCopyWith<$Res> {
  factory $RemoteFileModelCopyWith(
          RemoteFileModel value, $Res Function(RemoteFileModel) then) =
      _$RemoteFileModelCopyWithImpl<$Res, RemoteFileModel>;
  @useResult
  $Res call({FileModel fileInfo, LocalFileModel? localVersion});

  $FileModelCopyWith<$Res> get fileInfo;
  $LocalFileModelCopyWith<$Res>? get localVersion;
}

/// @nodoc
class _$RemoteFileModelCopyWithImpl<$Res, $Val extends RemoteFileModel>
    implements $RemoteFileModelCopyWith<$Res> {
  _$RemoteFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileInfo = null,
    Object? localVersion = freezed,
  }) {
    return _then(_value.copyWith(
      fileInfo: null == fileInfo
          ? _value.fileInfo
          : fileInfo // ignore: cast_nullable_to_non_nullable
              as FileModel,
      localVersion: freezed == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as LocalFileModel?,
    ) as $Val);
  }

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get fileInfo {
    return $FileModelCopyWith<$Res>(_value.fileInfo, (value) {
      return _then(_value.copyWith(fileInfo: value) as $Val);
    });
  }

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalFileModelCopyWith<$Res>? get localVersion {
    if (_value.localVersion == null) {
      return null;
    }

    return $LocalFileModelCopyWith<$Res>(_value.localVersion!, (value) {
      return _then(_value.copyWith(localVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemoteFileModelImplCopyWith<$Res>
    implements $RemoteFileModelCopyWith<$Res> {
  factory _$$RemoteFileModelImplCopyWith(_$RemoteFileModelImpl value,
          $Res Function(_$RemoteFileModelImpl) then) =
      __$$RemoteFileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FileModel fileInfo, LocalFileModel? localVersion});

  @override
  $FileModelCopyWith<$Res> get fileInfo;
  @override
  $LocalFileModelCopyWith<$Res>? get localVersion;
}

/// @nodoc
class __$$RemoteFileModelImplCopyWithImpl<$Res>
    extends _$RemoteFileModelCopyWithImpl<$Res, _$RemoteFileModelImpl>
    implements _$$RemoteFileModelImplCopyWith<$Res> {
  __$$RemoteFileModelImplCopyWithImpl(
      _$RemoteFileModelImpl _value, $Res Function(_$RemoteFileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileInfo = null,
    Object? localVersion = freezed,
  }) {
    return _then(_$RemoteFileModelImpl(
      fileInfo: null == fileInfo
          ? _value.fileInfo
          : fileInfo // ignore: cast_nullable_to_non_nullable
              as FileModel,
      localVersion: freezed == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as LocalFileModel?,
    ));
  }
}

/// @nodoc

class _$RemoteFileModelImpl implements _RemoteFileModel {
  const _$RemoteFileModelImpl(
      {required this.fileInfo, required this.localVersion});

  @override
  final FileModel fileInfo;
  @override
  final LocalFileModel? localVersion;

  @override
  String toString() {
    return 'RemoteFileModel(fileInfo: $fileInfo, localVersion: $localVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFileModelImpl &&
            (identical(other.fileInfo, fileInfo) ||
                other.fileInfo == fileInfo) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileInfo, localVersion);

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFileModelImplCopyWith<_$RemoteFileModelImpl> get copyWith =>
      __$$RemoteFileModelImplCopyWithImpl<_$RemoteFileModelImpl>(
          this, _$identity);
}

abstract class _RemoteFileModel implements RemoteFileModel {
  const factory _RemoteFileModel(
      {required final FileModel fileInfo,
      required final LocalFileModel? localVersion}) = _$RemoteFileModelImpl;

  @override
  FileModel get fileInfo;
  @override
  LocalFileModel? get localVersion;

  /// Create a copy of RemoteFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFileModelImplCopyWith<_$RemoteFileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
