// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    required int currentPage,
    required bool hasMore,
  }) = _Pagination;
}