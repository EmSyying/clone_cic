import 'package:cicgreenloan/utils/select_address/address_model/address.dart';

class PersonalInfo {
  String? fullName;
  String? sex;
  String? emailAddress;
  String? phone;
  String? currentHoNo;
  String? currentSt;
  Address? currentPro;
  Address? currentDist;
  Address? currentCom;
  Address? currentVill;
  String? residentHoNo;
  String? residentSt;
  Address? residentPro;
  Address? residentDist;
  Address? residentCom;
  Address? residentVill;

  PersonalInfo(
      {this.fullName,
      this.sex,
      this.emailAddress,
      this.phone,
      this.currentHoNo,
      this.currentSt,
      this.currentPro,
      this.currentDist,
      this.currentCom,
      this.currentVill,
      this.residentHoNo,
      this.residentSt,
      this.residentPro,
      this.residentDist,
      this.residentCom,
      this.residentVill});
}
