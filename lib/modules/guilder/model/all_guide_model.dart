import 'package:cicgreenloan/modules/guilder/model/guide_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_guide_model.freezed.dart';
part 'all_guide_model.g.dart';

@freezed
class AllGuideLine with _$AllGuideLine {
  factory AllGuideLine({
    @JsonKey(name: "bonus") final List<GuideModel>? bonus,
    @JsonKey(name: "directory") final List<GuideModel>? directory,
    @JsonKey(name: "investment") final List<GuideModel>? investment,
    @JsonKey(name: "report") final List<GuideModel>? report,
    @JsonKey(name: "ut_trading") final List<GuideModel>? trading,
  }) = _AllGuideLine;
  factory AllGuideLine.fromJson(Map<String, dynamic> json) =>
      _$AllGuideLineFromJson(json);
}
