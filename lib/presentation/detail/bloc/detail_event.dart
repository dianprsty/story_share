part of 'detail_bloc.dart';

@freezed
abstract class DetailEvent with _$DetailEvent {
  const factory DetailEvent.getPostById(String id) = _GetPostById;
}