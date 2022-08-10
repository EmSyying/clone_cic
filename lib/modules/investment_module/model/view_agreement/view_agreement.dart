import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_agreement.freezed.dart';
part 'view_agreement.g.dart';

@freezed
class ViewAgreement with _$ViewAgreement {
  factory ViewAgreement({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'color_code') String? color,
    @JsonKey(name: 'title') String? title,
  }) = _ViewAgreement;

  factory ViewAgreement.fromJson(Map<String, dynamic> json) =>
      _$ViewAgreementFromJson(json);
}

