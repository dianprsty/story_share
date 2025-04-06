import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constant/general_state.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecase/upload_post/upload_post_param.dart';
import '../../../domain/usecase/upload_post/upload_post_usecase.dart';

part 'upload_event.dart';
part 'upload_state.dart';
part 'upload_bloc.freezed.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadPostUsecase uploadPostUsecase;
  UploadBloc({required this.uploadPostUsecase}) : super(UploadState()) {
    on<_Upload>(_uploadPost);
  }

  void _uploadPost(UploadEvent event, emit) async {
    emit(state.copyWith(status: GeneralState.loading));

    var result = await uploadPostUsecase.call(event.data);

    if (result is Success) {
      emit(
        state.copyWith(
          status: GeneralState.success,
          message: result.resultValue ?? '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GeneralState.error,
          message: result.errorMessage ?? '',
        ),
      );
    }
  }
}
