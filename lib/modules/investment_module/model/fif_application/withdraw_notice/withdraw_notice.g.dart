// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WithdrawNotice _$$_WithdrawNoticeFromJson(Map<String, dynamic> json) =>
    _$_WithdrawNotice(
      title: json['title'] as String?,
      description: json['description'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WithdrawNoticeToJson(_$_WithdrawNotice instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'options': instance.options,
    };
