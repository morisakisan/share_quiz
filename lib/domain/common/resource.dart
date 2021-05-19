import 'package:freezed_annotation/freezed_annotation.dart';
part 'resource.freezed.dart';

@freezed
abstract class Resource<T> with _$Resource {
  factory Resource(T value) = Success;
  factory Resource.loading() = Loading;
  factory Resource.error(Exception error) = Error;
}