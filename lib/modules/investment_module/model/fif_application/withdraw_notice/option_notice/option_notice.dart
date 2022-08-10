import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_notice.freezed.dart';
part 'option_notice.g.dart';

@freezed
class OptionNotice with _$OptionNotice {
  factory OptionNotice({
    String? title,
    String? description,
  }) = _OptionNotice;

  factory OptionNotice.fromJson(Map<String, dynamic> json) =>
      _$OptionNoticeFromJson(json);
}
