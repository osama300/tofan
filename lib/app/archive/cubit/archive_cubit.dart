import 'package:tofan/app/archive/data/models/archive_response.dart';
import 'package:tofan/app/archive/data/models/data_request.dart';
import 'package:tofan/app/archive/data/repos/archive_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'archive_state.dart';
part 'archive_cubit.freezed.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(const ArchiveState.initial()) {
    init(DataRequest.articles);
  }

  Future<void> init(DataRequest request) async {
    switch (request) {
      case DataRequest.nakba:
        getNakba();
        break;
      case DataRequest.massacre:
        getMassacre();
        break;
      case DataRequest.aqsa:
        getAqsa();
        break;
      case DataRequest.place:
        getPlace();
        break;
      case DataRequest.articles:
        getArticles();
        break;
    }
  }

  void getNakba() async {
    emit(const ArchiveState.loading());
    final login = await ArchiveRepo().getNakba();
    login.when(
      success: (re) {
        var res = re['data'];

        try {
          emit(ArchiveState.success(res
              .map<ArchiveResponse>(
                (e) => ArchiveResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          print(e);
          print(res.runtimeType);
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const ArchiveState.error());
      },
    );
  }

  void getMassacre() async {
    emit(const ArchiveState.loading());
    final login = await ArchiveRepo().getMassacre();
    login.when(
      success: (re) {
        var res = re['data'];
        try {
          emit(ArchiveState.success(res
              .map<ArchiveResponse>(
                (e) => ArchiveResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          print(e);
          print(res.runtimeType);
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const ArchiveState.error());
      },
    );
  }

  void getAqsa() async {
    emit(const ArchiveState.loading());
    final login = await ArchiveRepo().getAqsa();
    login.when(
      success: (re) {
        var res = re['data'];
        try {
          emit(ArchiveState.success(res
              .map<ArchiveResponse>(
                (e) => ArchiveResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          print(e);
          print(res.runtimeType);
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const ArchiveState.error());
      },
    );
  }

  void getPlace() async {
    emit(const ArchiveState.loading());
    final login = await ArchiveRepo().getPlace();
    login.when(
      success: (re) {
        var res = re['data'];
        try {
          emit(ArchiveState.success(res
              .map<ArchiveResponse>(
                (e) => ArchiveResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          print(e);
          print(res.runtimeType);
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const ArchiveState.error());
      },
    );
  }

  void getArticles() async {
    emit(const ArchiveState.loading());
    final login = await ArchiveRepo().getArticles();
    login.when(
      success: (re) {
        var res = re['data'];
        try {
          emit(ArchiveState.success(res
              .map<ArchiveResponse>(
                (e) => ArchiveResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          print(e);
          print(res.runtimeType);
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const ArchiveState.error());
      },
    );
  }
// The rest of your code remains unchanged
}
