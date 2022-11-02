import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginatedResponse<Model> with _$PaginatedResponse<Model> {
  const PaginatedResponse._();

  factory PaginatedResponse({
    required int first,
    required int last,
    required int limit,
    required int total,
    required List<Model> data,
  }) = _PaginatedResponse<Model>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    dynamic fromJsonT,
  ) {
    return _$PaginatedResponseFromJson<Model>(json, fromJsonT);
  }

  bool get hasMore => last < total;
}
