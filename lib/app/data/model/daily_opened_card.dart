import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'daily_opened_card.g.dart';

@JsonSerializable()
class DailyOpenedCard {
  String id;
  String me, you;
  @DateTimeConverter()
  DateTime? createdAt;

  DailyOpenedCard({this.id = '',
      required this.me,
      required this.you,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory DailyOpenedCard.fromJson(json) => _$DailyOpenedCardFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$DailyOpenedCardToJson(this);
}
