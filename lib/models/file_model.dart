import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';


@freezed
sealed class FileModel with _$FileModel {
  const factory FileModel({
    required String name,
    required int size,
    required DateTime date,
  }) = _FileModel;
}

@freezed
sealed class LocalFileModel with _$LocalFileModel {
  const factory LocalFileModel({
    required FileModel fileInfo,
    required RemoteFileModel? remoteVersion,
  }) = _LocalFileModel;
}

@freezed
sealed class RemoteFileModel with _$RemoteFileModel {
  const factory RemoteFileModel({
    required FileModel fileInfo,
    required LocalFileModel? localVersion,
  }) = _RemoteFileModel;
}