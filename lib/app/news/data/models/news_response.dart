import 'package:json_annotation/json_annotation.dart';
part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  String title;
  String body;
  String img;
  String date;

  NewsResponse({
    required this.title,
    required this.body,
    required this.img,
    required this.date,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
