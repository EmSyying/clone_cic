import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FullAddress extends Equatable {
  String? streetNo;
  String? houseNo;
  List<Address>? addressList = [];

  FullAddress({this.streetNo, this.houseNo, this.addressList});

  @override
  List<Object?> get props => [streetNo, houseNo, addressList];
}
