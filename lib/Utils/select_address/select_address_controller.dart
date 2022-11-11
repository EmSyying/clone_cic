import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/flavor/flavor_configuration.dart';
import '../../modules/member_directory/models/personal_infor.dart';

import '../../modules/member_directory/models/user.dart';
import '../../utils/select_address/address_model/address.dart';
import '../../utils/select_address/address_model/currency.dart';
import '../../utils/select_address/address_model/full_address_model.dart';
import '../helper/option_model/gender.dart';

class RequestLoanController extends GetxController {
  var personalInfor = PersonalInfo().obs;
  final currentAddressList = <Address>[].obs;
  // var workInfor = WorkInfo().obs;
  final currency = Currency().obs;
  final currencyList = <Currency>[].obs;
  final provinceList = <Address>[].obs;
  final districtList = <Address>[].obs;
  final communeList = <Address>[].obs;
  final villageList = <Address>[].obs;
  // final positionList = <Position>[].obs;
  final genderList = <GenderOption>[].obs;
  final gender = GenderOption().obs;
  final fullName = ''.obs;
  final email = ''.obs;

  final selectAddress = <Address>[].obs;
  final phoneNumber = ''.obs;
  final selectCurrentAdd = ''.obs;
  final selectedAddressOption = 1.obs;
  final residentAddressIndex = 0.obs;
  final selectResidentAddList = <Address>[].obs;
  final residentProIndex = 100.obs;
  final residentDistrictIndex = 100.obs;
  final residentCommuneIndex = 100.obs;
  final residetnVillageIndex = 100.obs;
  final selectResidentAddress = ''.obs;
  final date = ''.obs;
  final selectProId = 0.obs;
  final selectDistrictId = 0.obs;
  final selectVillageId = 0.obs;
  final selectResProId = 0.obs;
  final selectResDictrictId = 0.obs;
  final selectResCommuneId = 0.obs;
  final selectResVillageId = 0.obs;
  final loanAmount = 0.0.obs;
  final selectCommuneId = 0.obs;
  final loanDuration = GenderOption().obs;
  File? frontID;
  File? backId;
  File? familyBook;
  File? businessLegal;

  // Resident Address

  final residentProvinceList = <Address>[].obs;
  final residentDistrictList = <Address>[].obs;
  final residentCommuneList = <Address>[].obs;
  final residentVillageList = <Address>[].obs;
  String? currentlang;
  final isSelectedProvince = false.obs;
  final isSelectedDistrict = false.obs;
  final isSelectedCommune = false.obs;
  final isSelectedVillage = false.obs;
  // final position = Position().obs;
  final currentAddCode = ''.obs;
  final residentAddCode = ''.obs;
  final residentHoNo = ''.obs;
  final residentStreet = ''.obs;
  final isSelectResiPro = false.obs;
  final resProId = 0.obs;
  final isValidateResidentProvince = true.obs;
  final isSelectResidentProvince = false.obs;
  final residentProvince = ''.obs;
  final residentPro = Address().obs;

  final currentProvince = Address().obs;
  final currentDistrict = Address().obs;
  final currentCommune = Address().obs;
  final currentVillage = Address().obs;
  final residentProvinceLabel = Address().obs;
  final residentDistrict = Address().obs;
  final residentCommune = Address().obs;
  final residentVillage = Address().obs;
  final selectPosId = 0.obs;
  final selectCurrId = 0.obs;
  final purpose = Purpose().obs;
  final purposeList = <Purpose>[].obs;

  final fullCurrentAddress = FullAddress().obs;
  final currentStreeNo = ''.obs;
  final currentHouseNo = ''.obs;
  final residentStreetNo = ''.obs;
  final residentHouseNo = ''.obs;

  final selectPosition = "Select Position".obs;
  final selectCurrency = "Select Currency".obs;
  final isLoading = false.obs;

  final fullResidentAddress = FullAddress().obs;
  final residentAddressList = <Address>[].obs;
  Future<List<Address>> getProvince(String locale) async {
    isLoading(true);
    final provinceListLocal = <Address>[].obs;
    final provinceLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale';
    try {
      await http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          isSelectedDistrict.value = true;
          var responseData = json.decode(response.body);

          responseData.map((json) {
            provinceLocal.value = Address.fromJson(json);

            provinceListLocal.add(provinceLocal.value);

            provinceList.value = provinceListLocal;
          }).toList();
        } else {
          isSelectedDistrict.value = false;
        }
      });
    } finally {
      isLoading(false);
    }
    return provinceList;
  }

  Future<List<Address>> getDistrict(String code, String locale) async {
    final districtListLocal = <Address>[].obs;
    isLoading(true);
    final districtLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    try {
      await http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          isSelectedCommune.value = true;
          var responseData = json.decode(response.body);
          responseData.map((json) {
            districtLocal.value = Address.fromJson(json);
            districtListLocal.add(districtLocal.value);
            districtList.value = districtListLocal;
          }).toList();
        } else {
          isSelectedCommune.value = false;
        }
      });
    } finally {
      isLoading(false);
    }
    return districtList;
  }

  Future<List<Address>> getCommune(String code, String locale) async {
    final getCommuneListLocal = <Address>[].obs;
    final communeLocal = Address().obs;
    isLoading(true);
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    try {
      await http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          isSelectedVillage.value = true;
          var responseData = json.decode(response.body);
          responseData.map((json) {
            communeLocal.value = Address.fromJson(json);
            getCommuneListLocal.add(communeLocal.value);
            communeList.value = getCommuneListLocal;
          }).toList();
        } else {
          isSelectedVillage.value = false;
        }
      });
    } finally {
      isLoading(false);
    }
    return communeList;
  }

  Future<List<Address>> getVillage(String code, String locale) async {
    isLoading(true);
    final villageListLocal = <Address>[].obs;
    final villageLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    try {
      await http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          isSelectedVillage.value = true;
          var responseData = json.decode(response.body);
          responseData.map((json) {
            villageLocal.value = Address.fromJson(json);
            villageListLocal.add(villageLocal.value);
            villageList.value = villageListLocal;
          }).toList();
        } else {
          isSelectedVillage.value = false;
        }
      });
    } finally {
      isLoading(false);
    }
    return villageList;
  }

  //Resident Address

  Future<List<Address>> getResidentProvince(String locale) async {
    final resProvinceListLocal = <Address>[].obs;
    final resProvinceLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale';
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        isSelectedDistrict.value = true;
        var responseData = json.decode(response.body);
        responseData.map((json) {
          resProvinceLocal.value = Address.fromJson(json);
          resProvinceListLocal.add(resProvinceLocal.value);
          residentProvinceList.value = resProvinceListLocal;
        }).toList();
      } else {
        isSelectedDistrict.value = false;
      }
    });
    return residentProvinceList;
  }

  //
  Future<List<Address>> getResidentDistrict(String code, String locale) async {
    final residentDistrictListLocal = <Address>[].obs;
    final districtLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        isSelectedCommune.value = true;
        var responseData = json.decode(response.body);
        responseData.map((json) {
          districtLocal.value = Address.fromJson(json);
          residentDistrictListLocal.add(districtLocal.value);
          residentDistrictList.value = residentDistrictListLocal;
        }).toList();
      } else {
        isSelectedCommune.value = false;
      }
    });
    return residentDistrictList;
  }

  Future<List<Address>> getResidentCommune(String code, String locale) async {
    final getCommuneListLocal = <Address>[].obs;
    final communeLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        isSelectedVillage.value = true;
        var responseData = json.decode(response.body);
        responseData.map((json) {
          communeLocal.value = Address.fromJson(json);
          getCommuneListLocal.add(communeLocal.value);
          residentCommuneList.value = getCommuneListLocal;
        }).toList();
      } else {
        isSelectedVillage.value = false;
      }
    });
    return residentCommuneList;
  }

  Future<List<Purpose>> getPurposeList() async {
    final purpose = Purpose().obs;
    final purposeList = <Purpose>[].obs;
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}option';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['purpose'];

          responseData.map(
            (jsonData) {
              purpose.value = Purpose.fromJson(jsonData);

              purposeList.add(purpose.value);

              purposeList.value = purposeList;
            },
          ).toList();
        } else {}
      });
    } catch (e) {
      //
    }
    return purposeList;
  }

  onCreatePersonInfo(
      {String? fullName,
      String? sex,
      String? email,
      String? phone,
      String? currentHoNo,
      String? currentSt,
      Address? currentPro,
      Address? currentDist,
      Address? currentCom,
      Address? currentVill,
      String? residentHoNo,
      String? residentSt,
      Address? residentPro,
      Address? residentDist,
      Address? residentCom,
      Address? residentVill}) {
    personalInfor = PersonalInfo(
            fullName: fullName!,
            sex: sex!,
            emailAddress: email!,
            phone: phone!,
            currentHoNo: currentHoNo!,
            currentSt: currentSt!,
            currentPro: currentPro!,
            currentDist: currentDist!,
            currentCom: currentCom!,
            currentVill: currentVill!,
            residentHoNo: residentHoNo!,
            residentSt: residentSt!,
            residentPro: residentPro!,
            residentDist: residentDist!,
            residentCom: residentCom!,
            residentVill: residentVill!)
        .obs;
  }

  Future<List<Address>> getResidentVillage(String code, String locale) async {
    final villageListLocal = <Address>[].obs;
    final villageLocal = Address().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}address?lang=$locale&code=$code';
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        isSelectedVillage.value = true;
        var responseData = json.decode(response.body);
        responseData.map((json) {
          villageLocal.value = Address.fromJson(json);
          villageListLocal.add(villageLocal.value);
          residentVillageList.value = villageListLocal;
        }).toList();
      } else {
        isSelectedVillage.value = false;
      }
    });
    return residentVillageList;
  }

  Future<List<GenderOption>> getGender() async {
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}option';
    final genderList = <GenderOption>[].obs;
    final gender = GenderOption().obs;
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['gender'];
          responseData.map(
            (jsonData) {
              gender.value = GenderOption.fromJson(jsonData);

              genderList.add(gender.value);

              genderList.value = genderList;
            },
          ).toList();
        } else {}
      });
    } catch (e) {
      //
    }
    return genderList;
  }

  Future<List<Currency>> getCurrency() async {
    final currency = Currency().obs;
    final currencyList = <Currency>[].obs;
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}option';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['currency'];
          if (responseData != null) {
            currencyList.clear();
            responseData.map(
              (jsonData) {
                currency.value = Currency.fromJson(jsonData);

                currencyList.add(currency.value);
              },
            ).toList();
          }
        } else {}
      });
    } catch (e) {
      //
    }
    return currencyList;
  }

  @override
  void onInit() {
    getCurrentLanguage();
    getCurrency();

    super.onInit();
  }

  getCurrentLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    currentlang = pref.getString('locale');
    update();
  }
}
