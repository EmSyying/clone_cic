// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransferModel {
  final String? qrType;
  final String? phoneNumber;
  final String? amount;
  final String? idQR;
  final String? userName;
  TransferModel({
    this.idQR,
    this.userName,
    this.qrType,
    this.phoneNumber,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qrType': qrType,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'idQR': idQR,
      'userName': userName,
    };
  }

  factory TransferModel.fromMap(Map<String, dynamic> map) {
    return TransferModel(
      qrType: map['qrType'] != null ? map['qrType'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      idQR: map['idQR'] != null ? map['idQR'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferModel.fromJson(String source) =>
      TransferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TransferModel copyWith({
    String? qrType,
    String? phoneNumber,
    String? amount,
    String? idQR,
    String? userName,
  }) {
    return TransferModel(
      qrType: qrType ?? this.qrType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
      idQR: idQR ?? this.idQR,
      userName: userName ?? this.userName,
    );
  }
}
