import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

//todo 스템프 세팅 값을 담자 ㅇㅇ
@JsonSerializable()
class Picture {
  @JsonKey(name: 'id', required: true)
  String id;
  String url, userId, folderId;
  final Map<String, dynamic> stampSetting;

  Picture(
      {this.id = '',
      this.url = '',
      this.userId = '',
      this.folderId = '',
      this.stampSetting = const {
        'color': 'red',
        'stamp': 'stamp_1',
        'time': null,
        'format': 'format_1'
      }});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
