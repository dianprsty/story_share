import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constant/general_state.dart';
import '../../../domain/entities/post/post_entity.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecase/get_post_by_id/get_post_by_id_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetPostByIdUsecase getPostByIdUsecase;
  DetailBloc({
    required this.getPostByIdUsecase,
  }) : super(DetailState()) {
    on<_GetPostById>(_getPostById);
  }

  void _getPostById(_GetPostById event, Emitter<DetailState> emit) async{
    emit(state.copyWith(status: GeneralState.loading));

    var result = await getPostByIdUsecase.call(event.id);

    if (result is Success) {
      emit(
        state.copyWith(
          status: GeneralState.success,
          post: result.resultValue!,
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
