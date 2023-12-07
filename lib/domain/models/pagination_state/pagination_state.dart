// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_state.freezed.dart';

@freezed
abstract class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.loading() = _Loading<T>;
  const factory PaginationState.success(T data) = _Success<T>;
  const factory PaginationState.error(Object error, StackTrace stackTrace, T? previousData) = _Error<T>;
}
