
import 'package:json_annotation/json_annotation.dart';

part 'match_profile.g.dart';

@JsonSerializable()
class MatchProfile {
  @JsonKey(name: 'id', required: true)
  String? id;
  String userId, phoneNum, profileImage;

  MatchProfile(
      {this.id,
        this.userId = '',
        this.phoneNum = '',
        this.profileImage = ''});

  factory MatchProfile.fromJson(Map<String, dynamic> json) => _$MatchProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MatchProfileToJson(this);
}
