// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      title: json['title'] as String,
      body: json['body'] as String,
      img: json['img'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'img': instance.img,
      'date': instance.date,
    };
