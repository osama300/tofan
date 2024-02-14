part of 'archive_cubit.dart';

@freezed
class ArchiveState with _$ArchiveState {
  const factory ArchiveState.initial() = _Initial;
  const factory ArchiveState.loading() = _Loading;
  const factory ArchiveState.success(List<ArchiveResponse> archive) = _Success;
  const factory ArchiveState.error() = _Error;
}
