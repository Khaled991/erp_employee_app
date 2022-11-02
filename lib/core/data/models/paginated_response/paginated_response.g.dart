// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<Model> _$PaginatedResponseFromJson<Model>(
  Map<String, dynamic> json,
  Model Function(Object? json) fromJsonModel,
) =>
    PaginatedResponse<Model>(
      first: json['first'] as int,
      last: json['last'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      data: (json['data'] as List<dynamic>).map(fromJsonModel).toList(),
    );
