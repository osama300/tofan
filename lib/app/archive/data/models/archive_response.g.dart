// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchiveResponse _$ArchiveResponseFromJson(Map<String, dynamic> json) =>
    ArchiveResponse(
      title: json['title'] as String,
      description: json['description'] as String,
      img: json['img'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ArchiveResponseToJson(ArchiveResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'img': instance.img,
    };
