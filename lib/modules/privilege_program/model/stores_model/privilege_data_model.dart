import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../event_module/models/event_model.dart';

part 'privilege_data_model.freezed.dart';
part 'privilege_data_model.g.dart';

@freezed
class PrivilegeDataModel with _$PrivilegeDataModel {
  factory PrivilegeDataModel(
      {final List<PrivilegeShopModel>? data,
      final Links? links,
      final Meta? meta}) = _PrivilegeDataModel;

  factory PrivilegeDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeDataModelFromJson(json);
}
