import 'package:json_annotation/json_annotation.dart';
part 'archive_response.g.dart';

@JsonSerializable()
class ArchiveResponse {
  int id;
  String title;
  String description;
  String? img;

  ArchiveResponse({
    required this.title,
    required this.description,
    this.img,
    required this.id,
  });

  factory ArchiveResponse.fromJson(Map<String, dynamic> json) =>
      _$ArchiveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArchiveResponseToJson(this);
}
