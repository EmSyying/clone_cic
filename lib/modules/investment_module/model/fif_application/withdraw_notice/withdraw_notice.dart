import 'package:freezed_annotation/freezed_annotation.dart';

import 'option_notice/option_notice.dart';

part 'withdraw_notice.freezed.dart';
part 'withdraw_notice.g.dart';

@freezed
class WithdrawNotice with _$WithdrawNotice {
  factory WithdrawNotice({
    String? title,
    String? description,
    List<OptionNotice>? options,
  }) = _WithdrawNotice;

  factory WithdrawNotice.fromJson(Map<String, dynamic> json) =>
      _$WithdrawNoticeFromJson(json);
}
