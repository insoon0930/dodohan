import 'package:json_annotation/json_annotation.dart';
import '../enums.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id', required: true)
  final String id;
  String uid, phoneNum, profileImage;
  bool? isMan;
  // List<String> folders;
  // Map<String, dynamic> cameraSetting;
  // Map<String, dynamic> stampSetting;
  // bool darkMode;
  IdStatus? idStatus;
  DateTime? createdAt;
  DateTime? deletedAt;

  User({this.id = '',
    this.uid = '',
    this.phoneNum = '',
    this.profileImage = '',
    this.isMan,
    // this.folders = const [],
    // this.cameraSetting = const {
    //   'saveOriginal': true,
    //   'saveImmediately': true,
    //   'cameraImmediately': true
    // },
    // this.stampSetting = const {
    //   'color': 'red',
    //   'stamp': 'stamp_1',
    //   'time': null,
    //   'format': 'format_1'
    // },
    // this.darkMode = false,
    this.idStatus,
    this.createdAt,
    this.deletedAt,
  }) {
    createdAt ??= DateTime.now();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // bool get saveOriginal => cameraSetting['saveOriginal'];
  // bool get saveImmediately => cameraSetting['saveImmediately'];
  // bool get cameraImmediately => cameraSetting['cameraImmediately'];
  //
  // bool get color => stampSetting['color'];
  // bool get stamp => stampSetting['stamp'];
  // bool get time => stampSetting['time'];
  // bool get format => stampSetting['format'];
}
