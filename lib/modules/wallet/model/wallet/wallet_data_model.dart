import 'package:cicgreenloan/modules/wallet/model/invest/invester.dart';
import 'package:cicgreenloan/modules/wallet/model/wallet_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_data_model.freezed.dart';
part 'wallet_data_model.g.dart';

@freezed
class WalletDataModel with _$WalletDataModel {
  factory WalletDataModel({
    WalletAmountModel? wallet,
    InvesterModel? invester,
  }) = _WalletDataModel;

  factory WalletDataModel.fromJson(Map<String, dynamic> json) =>
      _$WalletDataModelFromJson(json);
}
