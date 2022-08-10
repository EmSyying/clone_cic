import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/step1_equity.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar_colorswhite.dart';

class TermAndConditions extends StatefulWidget {
  const TermAndConditions({Key? key}) : super(key: key);

  @override
  State<TermAndConditions> createState() => _TermAndConditionsState();
}

class _TermAndConditionsState extends State<TermAndConditions> {
  final reqCon = Get.put(RequestLoanController());
  final _con = Get.put(CustomerController());
  String locale = '';

  getCurrentLocale() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      locale = pref.getString('locale')!;
    });

    if (locale == 'en') {
      // reqCon.currentProvince.value = 'Select Province';
      // reqCon.currentDistrict.value = 'Select District';
      // reqCon.currentCommune.value = 'Select Commune';
      // reqCon.currentVillage.value = 'Select Village';
      // reqCon.residentProvinceLabel.value = 'Select Province';
      // reqCon.residentDistrict.value = 'Select District';
      // reqCon.residentCommune.value = 'Select Commune';
      // reqCon.residentVillage.value = 'Select Village';
      reqCon.selectPosition.value = 'Select Position';
      reqCon.selectCurrency.value = 'Select Currency';
    }
    if (locale == 'kh') {
      // reqCon.currentProvince.value = 'ជ្រើសរើសខេត្ត';
      // reqCon.currentDistrict.value = 'ជ្រើសរើសស្រុក/ខណ្ឌ';
      // reqCon.currentCommune.value = 'ជ្រើសរើសឃុំ/សង្កាត់';
      // reqCon.currentVillage.value = 'ជ្រើសរើសភូមិ';
      // reqCon.residentProvinceLabel.value = 'ជ្រើសរើសខេត្ត';
      // reqCon.residentDistrict.value = 'ជ្រើសរើសស្រុក/ខណ្ឌ';
      // reqCon.residentCommune.value = 'ជ្រើសរើសឃុំ/សង្កាត់';
      // reqCon.residentVillage.value = 'ជ្រើសរើសភូមិ';
      reqCon.selectPosition.value = 'ជ្រើសរើសតួនាទី';
      reqCon.selectCurrency.value = 'ជ្រើសរើសរូបិយបណ្ណ';
    }
  }

  @override
  void initState() {
    getCurrentLocale();
    _con.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
          context: context,
          title: 'Get Fundi ng',
          leading: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: SvgPicture.asset(
                          'assets/images/svgfile/notfundingIcon.svg')),
                  Text(S.of(context).required,
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).idcard,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).residentBook,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).familyBook,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).salaryslip,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Business Legal',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0.0, left: 10, right: 10),
              width: double.infinity,
              child: Column(
                children: [
                  CustomButton(
                    iconUrl: 'assets/images/svgfile/businessLoan.svg',
                    isOutline: false,
                    isDisable: false,
                    title: S.of(context).businessloan,
                    onPressed: () {
                      _con.loanType.value = 'Business';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Step1Equiry(

                                  // locale: locale,
                                  )));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    iconUrl: 'assets/images/svgfile/equipment.svg',
                    isOutline: true,
                    isDisable: false,
                    title: S.of(context).businessloan,
                    onPressed: () {
                      _con.loanType.value = 'Business';

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Step1Equiry(

                                  // locale: locale,
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
