import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardDetailModel with _$CardDetailModel {
  factory CardDetailModel({
    String? stausTitle,
    String? title,
    String? paragraph,
    int? number,
    String? imageCard,
  }) = _CardDetailModel;

  factory CardDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CardDetailModelFromJson(json);
}
