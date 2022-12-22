import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../Utils/helper/container_partern.dart';
import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../../widgets/get_funding/custom_select_2_getfunding.dart';

class EditCompanyInfo extends StatefulWidget {
  const EditCompanyInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<EditCompanyInfo> createState() => _EditCompanyInfoState();
}

class _EditCompanyInfoState extends State<EditCompanyInfo> {
  final DebtInvestmentController debtController =
      Get.put(DebtInvestmentController());
  final MemberController memCon = Get.put(MemberController());
  final optionCon = Get.put(DocumentCategory());

  DebtStep3Model step3local = DebtStep3Model();
  DebtStep3Model step3Defual = DebtStep3Model();
  TextEditingController addNewOtherType = TextEditingController();
  TextEditingController addNewOtherIndustry = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  TextEditingController taxcontroller = TextEditingController();
  TextEditingController numberofstaffcontroller = TextEditingController();
  TextEditingController ownernamecontroller = TextEditingController();
  TextEditingController productcontroller = TextEditingController();

  final optionController = Get.put(DocumentCategory());

  onResetCompany() {
    step3local.companyName = "";
    step3local.address = "";
    step3local.yearOfEstablishment = "";
    step3local.typeOfOrganization = Optionmodel(display: null, id: 0);
    step3local.taxIdentificationNumber = "";
    step3local.industry = Optionmodel(
      display: null,
      id: 0,
    );
    step3local.numberOfStaff = "";
    step3local.ownerName = "";
    step3local.productSevice = "";

    addresscontroller.text = "";
    yearcontroller.text = "";
    taxcontroller.text = "";
    numberofstaffcontroller.text = "";
    ownernamecontroller.text = "";
    productcontroller.text = "";

    debtController.isPatentDoc.value = false;
    debtController.isCertificate.value = false;
    debtController.isMemorandum.value = false;
    debtController.isLicense.value = false;
  }

  @override
  void initState() {
    step3local = DebtStep3Model(
      companyName: debtController.companyName.value,
      address: debtController.address.value,
      yearOfEstablishment: debtController.yearOfEstablishment.value,
      typeOfOrganization: debtController.typeOfOrganization.value,
      taxIdentificationNumber: debtController.taxIdentificationNumber.value,
      industry: debtController.industry.value,
      numberOfStaff: debtController.numberOfStaff.value,
      ownerName: debtController.ownerName.value,
      productSevice: debtController.productSevice.value,
      patentDoc: debtController.patentDocument.value,
      mocCertificate: debtController.certificatioDoc.value,
      licenceDoc: debtController.licenseDoc.value,
      memorandum: debtController.memorandumDoc.value,
    );
    //==
    addresscontroller.text = step3local.address!;
    yearcontroller.text = step3local.yearOfEstablishment!;
    taxcontroller.text = step3local.taxIdentificationNumber!;

    ///
    if (step3local.numberOfStaff != null && step3local.numberOfStaff != '') {
      var displaynumberofstaffcontroller = FormatNumber.formatNumberDefualt(
          int.parse(step3local.numberOfStaff!));
      numberofstaffcontroller.text = displaynumberofstaffcontroller.toString();
    } else {
      numberofstaffcontroller.text = '';
    }

    ownernamecontroller.text = step3local.ownerName!;
    productcontroller.text = step3local.productSevice!;

    //==
    step3Defual = DebtStep3Model(
      companyName: debtController.companyName.value,
      address: debtController.address.value,
      yearOfEstablishment: debtController.yearOfEstablishment.value,
      typeOfOrganization: debtController.typeOfOrganization.value,
      taxIdentificationNumber: debtController.taxIdentificationNumber.value,
      industry: debtController.industry.value,
      numberOfStaff: debtController.numberOfStaff.value,
      ownerName: debtController.ownerName.value,
      productSevice: debtController.productSevice.value,
      patentDoc: debtController.patentDocument.value,
      mocCertificate: debtController.certificatioDoc.value,
      licenceDoc: debtController.licenseDoc.value,
      memorandum: debtController.memorandumDoc.value,
    );
    if (debtController.applicationDetail.value.id != null) {
      onInitCompanyOption();
    }
    super.initState();
  }

  onInitCompanyOption() {
    if (debtController.patentDocument.value == 1) {
      debtController.isPatentDoc.value = true;
    } else {
      debtController.isPatentDoc.value = false;
    }
    if (debtController.certificatioDoc.value == 1) {
      debtController.isCertificate.value = true;
    } else {
      debtController.isCertificate.value = false;
    }
    if (debtController.licenseDoc.value == 1) {
      debtController.isLicense.value = true;
    } else {
      debtController.isLicense.value = false;
    }
    if (debtController.memorandumDoc.value == 1) {
      debtController.isMemorandum.value = true;
    } else {
      debtController.isMemorandum.value = false;
    }
  }

  _onpressPersonalInfo(
    context,
    String companyName,
    String adress,
    String year,
    Optionmodel type,
    Optionmodel industry,
    String tan,
    String numberofstaff,
    String ownername,
    String productandsevice,
    int patentDoc,
    int mocCertification,
    int licenseDoc,
    int memorandum,
  ) {
    if (companyName == '') {
      debtController.isValCompanyName.value = false;
    } else {
      debtController.isValCompanyName.value = true;
    }

    if (adress == '') {
      debtController.isValAddress.value = false;
    } else {
      debtController.isValAddress.value = true;
    }

    if (year == '') {
      debtController.isValYearOfEstablishment.value = false;
    } else {
      debtController.isValYearOfEstablishment.value = true;
    }

    if (type.display == null) {
      debtController.isValTypeOfOrganization.value = false;
    } else {
      debtController.isValTypeOfOrganization.value = true;
    }

    if (industry.display == null) {
      debtController.isValIndustry.value = false;
    } else {
      debtController.isValIndustry.value = true;
    }

    if (numberofstaff == '') {
      debtController.isValNumberOfStaff.value = false;
    } else {
      debtController.isValNumberOfStaff.value = true;
    }

    if (ownername == '') {
      debtController.isValOwnerName.value = false;
    } else {
      debtController.isValOwnerName.value = true;
    }

    if (productandsevice == '') {
      debtController.isValProductService.value = false;
    } else {
      debtController.isValProductService.value = true;
    }

    if (productandsevice != '' &&
        ownername != '' &&
        numberofstaff != '0' &&
        industry.display != null &&
        type.display != null &&
        year != '' &&
        adress != '' &&
        companyName != '') {
      debtController.companyName.value = companyName;
      debtController.address.value = adress;
      debtController.addresscontroller.text = adress;
      debtController.yearOfEstablishment.value = year;
      yearcontroller.text = year;
      debtController.yearofestablistmentController.text = year;
      debtController.typeOfOrganization.value = type;
      debtController.industry.value = industry;
      debtController.numberOfStaff.value = numberofstaff.toString();

      ///
      debtController.numberofStaffController.text = numberofstaff.toString();

      debtController.ownerName.value = ownername;
      debtController.ownernameController.text = ownername;
      ownernamecontroller.text = ownername;
      debtController.productSevice.value = productandsevice;
      debtController.productController.text = productandsevice;
      productcontroller.text = productandsevice;
      debtController.taxIdentificationNumber.value = tan;
      taxcontroller.text = tan;
      debtController.taxindentificationController.text = tan;

      debtController.patentDocument.value = step3local.patentDoc!;
      debtController.licenseDoc.value = step3local.licenceDoc!;
      debtController.certificatioDoc.value = step3local.mocCertificate!;
      debtController.memorandumDoc.value = step3local.memorandum!;

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: padding - 5),
                memCon.companyDataList.isNotEmpty &&
                        memCon.addCompany.value == false
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CICDropdown(
                          colors: Colors.white,
                          onCreateCompany: () {
                            memCon.addCompany.value = true;
                            onResetCompany();
                            memCon.update();
                            Navigator.pop(context);
                          },
                          isCompany: true,
                          isValidate: debtController.isValCompanyName.value,
                          item: memCon.companyDataList.asMap().entries.map((e) {
                            return DropDownItem(
                              itemList: {
                                "Name": e.value.companyName!,
                                "Code": e.key.toString(),
                                "Address": e.value.address ?? '',
                                "Product": e.value.companyProductAndService!,
                                "Tax": e.value.taxIdentificationNumber ?? '',
                                "Year": e.value.yearFounded,
                                "Typeid": e.value.typeOfOrganization != null
                                    ? e.value.typeOfOrganization!.id.toString()
                                    : '0',
                                "TypeDis": e.value.typeOfOrganization != null
                                    ? e.value.typeOfOrganization!.display
                                    : null,
                                "Industryid": e.value.industry != null
                                    ? e.value.industry!.id.toString()
                                    : '0',
                                "IndustryDis": e.value.industry != null
                                    ? e.value.industry!.display
                                    : null,
                                "NumberOfStaff": e.value.numberOfStaff != null
                                    ? e.value.numberOfStaff.toString() == '0'
                                        ? ''
                                        : e.value.numberOfStaff.toString()
                                    : '',
                                "OwnerName": e.value.ownerName ?? '',
                                "patent": e.value.companyFiles != null
                                    ? e.value.companyFiles!.companyPatentDoc
                                    : [],
                                "moc": e.value.companyFiles != null
                                    ? e.value.companyFiles!
                                        .companyMoCCertificate
                                    : [],
                                "licence": e.value.companyFiles != null
                                    ? e.value.companyFiles!.companyLicenceDoc
                                    : []
                              },
                            );
                          }).toList(),
                          onChange: (v) {
                            setState(() {
                              step3local.companyName = v["Name"];
                              step3local.address = v["Address"];
                              addresscontroller.text = v["Address"];
                              step3local.productSevice = v["Product"];
                              productcontroller.text = v["Product"];
                              step3local.yearOfEstablishment = v["Year"];
                              yearcontroller.text = v["Year"];
                              step3local.taxIdentificationNumber = v["Tax"];
                              taxcontroller.text = v["Tax"];
                              step3local.numberOfStaff = v["NumberOfStaff"];

                              ///
                              if (v["NumberOfStaff"] != '') {
                                var displaynumberofstaff =
                                    FormatNumber.formatNumberDefualt(
                                        int.parse(v["NumberOfStaff"]));
                                numberofstaffcontroller.text =
                                    displaynumberofstaff.toString();
                              } else {
                                numberofstaffcontroller.text = '';
                              }

                              ///
                              step3local.ownerName = v["OwnerName"];
                              ownernamecontroller.text = v["OwnerName"];
                              step3local.typeOfOrganization = Optionmodel(
                                  id: int.parse(v['Typeid']),
                                  display: v['TypeDis']);
                              step3local.industry = Optionmodel(
                                  id: int.parse(v['Industryid']),
                                  display: v['IndustryDis']);

                              debtController.isValAddress.value = true;
                              debtController.isValProductService.value = true;
                              debtController.isValCompanyName.value = true;
                              debtController.isValYearOfEstablishment.value =
                                  true;
                              debtController.isValNumberOfStaff.value = true;
                              debtController.isValOwnerName.value = true;
                              debtController.isValTypeOfOrganization.value =
                                  true;
                              debtController.isValIndustry.value = true;
                            });
                          },
                          label: 'Company Name',
                          defaultValue: step3local.companyName != ''
                              ? {"Name": step3local.companyName, "Code": 0}
                              : null,
                        ),
                      )
                    : CustomTextFieldNew(
                        textInputAction: TextInputAction.next,
                        autoFocus: memCon.addCompany.value,
                        isRequired: true,
                        isValidate: debtController.isValCompanyName.value,
                        labelText: 'Company Name',
                        hintText: 'Company Name',
                        onChange: (value) {
                          setState(() {
                            debtController.isValCompanyName.value = true;
                            if (value.isEmpty) {
                              setState(() {
                                step3local.companyName = '';
                              });
                            } else {
                              setState(() {
                                step3local.companyName = value;
                              });
                            }
                          });
                        },
                        initialValue: step3local.companyName,
                      ),
                CustomTextFieldNew(
                  autoFocus: memCon.addCompany.value,
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  controller: addresscontroller,
                  isValidate: debtController.isValAddress.value,
                  labelText: 'Address',
                  hintText: 'Address',
                  onChange: (value) {
                    if (value.isEmpty) {
                      debtController.isValAddress.value = false;
                      setState(() {
                        step3local.address = '';
                      });
                    } else {
                      setState(() {
                        step3local.address = value;
                      });
                      debtController.isValAddress.value = true;
                    }
                  },
                  initialValue: step3local.address,
                ),
                CustomTextFieldNew(
                  maxlenght: 4,
                  keyboardType: TextInputType.number,
                  inputFormatterList: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                  ],
                  // autoFocus: memCon.addCompany.value,
                  controller: yearcontroller,
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  isValidate: debtController.isValYearOfEstablishment.value,
                  labelText: 'Year of Establishment',
                  hintText: 'Year of Establishment',

                  //  onChange: (value) {
                  //   if (value.isNotEmpty) {
                  //     debtCon.isValidateTerm.value = true;
                  //     setState(() {
                  //       debt2Data.term = int.parse(value);
                  //     });
                  //     setState(() {
                  //       debtCon.isValidateTerm.value = true;
                  //       debtCon.term.value = int.parse(value);
                  //       if (debtCon.term.value <
                  //               debtCon.optionData.value.duration!.minimum! ||
                  //           debtCon.term.value >
                  //               debtCon.optionData.value.duration!.maximum!) {
                  //         debtCon.isValidateTermAmount.value = true;
                  //       } else {
                  //         debtCon.isValidateTermAmount.value = false;
                  //       }
                  //     });
                  //   } else {
                  //     debtCon.isValidateTerm.value = false;
                  //     setState(() {
                  //       debt2Data.term = 0;
                  //     });
                  //   }
                  // },
                  onChange: (value) {
                    if (value.isEmpty) {
                      debtController.isValYearOfEstablishment.value = false;
                      setState(() {
                        step3local.yearOfEstablishment = '';
                      });
                    } else {
                      setState(() {
                        step3local.yearOfEstablishment = value;
                      });
                      debtController.isValYearOfEstablishment.value = true;
                    }
                  },

                  initialValue: step3local.yearOfEstablishment,
                ),
                CICDropdown(
                  otherLabel: "Add Other",
                  onCreateCompany: () {
                    Navigator.pop(context);

                    onShowAddOtherLabel(
                      title: "Add Other",
                      onBack: () {
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onSave: () {
                        setState(() {
                          step3local.typeOfOrganization = Optionmodel(
                              display: addNewOtherType.text, id: null);
                          if (addNewOtherType.text != "") {
                            step3local.typeOfOrganization!.id = null;
                            debtController.isValTypeOfOrganization.value = true;
                          }
                        });
                        Navigator.pop(context);
                      },
                      // onSave: () {
                      //   setState(() {
                      //     step3local.typeOfOrganization = Optionmodel(
                      //         display: addNewOtherType.text, id: null);
                      //   });
                      //   if (addNewOtherType.text != "") {
                      //     debtController.typeOfOrganization.value.id = null;
                      //   }
                      //   Navigator.pop(context);
                      // },
                      context: context,
                      textFieldHere: CustomTextFieldNew(
                        controller: addNewOtherType,
                        hintText: 'Type of organization',
                        labelText: 'Type of organization',
                      ),
                    );
                  },
                  isCompany: true,
                  colors: Colors.white,
                  isValidate: debtController.isValTypeOfOrganization.value,
                  item: optionCon.optionData.value.organization!
                      .asMap()
                      .entries
                      .map((e) {
                    return DropDownItem(
                      itemList: {
                        "Name": e.value.display!,
                        "Code": e.value.id.toString()
                      },
                    );
                  }).toList(),
                  onChange: (v) {
                    setState(() {
                      step3local.typeOfOrganization = Optionmodel(
                        display: v["Name"],
                        id: int.parse(v["Code"]),
                      );
                      debtController.isValTypeOfOrganization.value = true;
                    });
                  },
                  label: 'Type of Organization',
                  defaultValue: step3local.typeOfOrganization!.display != null
                      ? {
                          "Name": step3local.typeOfOrganization!.display,
                          "Code": step3local.typeOfOrganization!.id
                        }
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldNew(
                  controller: taxcontroller,
                  textInputAction: TextInputAction.next,
                  labelText: 'Tax Identification Number (TIN)',
                  hintText: 'Tax Identification Number (TIN)',
                  onChange: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        step3local.taxIdentificationNumber = '';
                      });
                    } else {
                      setState(() {
                        step3local.taxIdentificationNumber = value;
                      });
                    }
                  },
                  initialValue: step3local.taxIdentificationNumber,
                ),
                CICDropdown(
                  otherLabel: "Add Other",
                  onCreateCompany: () {
                    Navigator.pop(context);

                    onShowAddOtherLabel(
                      title: "Add Other",
                      onBack: () {
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onSave: () {
                        setState(() {
                          step3local.industry = Optionmodel(
                              display: addNewOtherIndustry.text, id: null);
                          if (addNewOtherIndustry.text != "") {
                            step3local.industry!.id = null;
                            debtController.isValIndustry.value = true;
                          }
                        });
                        Navigator.pop(context);
                      },
                      context: context,
                      textFieldHere: CustomTextFieldNew(
                        controller: addNewOtherIndustry,
                        hintText: 'Industry',
                        labelText: 'Industry',
                      ),
                    );
                  },
                  isCompany: true,
                  colors: Colors.white,
                  isValidate: debtController.isValIndustry.value,
                  item: optionCon.optionData.value.organization!
                      .asMap()
                      .entries
                      .map((e) {
                    return DropDownItem(
                      itemList: {
                        "Name": e.value.display!,
                        "Code": e.value.id.toString()
                      },
                    );
                  }).toList(),
                  onChange: (v) {
                    setState(() {
                      step3local.industry = Optionmodel(
                        display: v["Name"],
                        id: int.parse(v["Code"]),
                      );
                      debtController.isValIndustry.value = true;
                    });
                  },
                  label: 'Industry',
                  defaultValue: step3local.industry!.display != null
                      ? {
                          "Name": step3local.industry!.display,
                          "Code": step3local.industry!.id
                        }
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldNew(
                  autoFocus: memCon.addCompany.value,
                  controller: numberofstaffcontroller,
                  isRequired: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatterList: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    NumericTextFormatter()
                  ],
                  isValidate: debtController.isValNumberOfStaff.value,
                  labelText: 'Number of Staff',
                  hintText: 'Number of Staff',
                  onChange: (valueChnaged) {
                    var value = valueChnaged.replaceAll(',', '');
                    if (value == "") {
                      debtController.isValNumberOfStaff.value = false;
                      setState(() {
                        step3local.numberOfStaff = "0";
                      });
                    } else {
                      setState(() {
                        step3local.numberOfStaff = value;
                      });
                      debtController.isValNumberOfStaff.value = true;
                    }
                  },
                  initialValue: step3local.numberOfStaff.toString(),
                ),
                CustomTextFieldNew(
                  autoFocus: memCon.addCompany.value,
                  controller: ownernamecontroller,
                  isRequired: true,
                  isValidate: debtController.isValOwnerName.value,
                  textInputAction: TextInputAction.next,
                  labelText: 'Owner Name',
                  hintText: 'Owner Name',
                  onChange: (value) {
                    if (value.isEmpty) {
                      debtController.isValOwnerName.value = false;
                      setState(() {
                        step3local.ownerName = '';
                      });
                    } else {
                      debtController.isValOwnerName.value = true;
                      setState(() {
                        step3local.ownerName = value;
                      });
                    }
                  },
                  initialValue: step3local.ownerName,
                ),
                CustomTextFieldNew(
                  isRequired: true,
                  autoFocus: memCon.addCompany.value,
                  textInputAction: TextInputAction.done,
                  controller: productcontroller,
                  isValidate: debtController.isValProductService.value,
                  hintText: 'Product / Service',
                  labelText: 'Product / Service ',
                  onChange: (value) {
                    if (value.isEmpty) {
                      debtController.isValProductService.value = false;
                      setState(() {
                        step3local.productSevice = '';
                      });
                    } else {
                      setState(() {
                        step3local.productSevice = value;
                      });
                      debtController.isValProductService.value = true;
                    }
                  },
                  initialValue: step3local.productSevice,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Which of the following legal documents that you have? (Multiple selectionsss)',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 20, right: 20, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSelect2GetFunding(
                        isMultipleSelect: true,
                        title: 'Company’s Patent Document',
                        isSelect: debtController.isPatentDoc.value,
                        ontap: () {
                          debtController.isPatentDoc.value =
                              !debtController.isPatentDoc.value;
                          setState(() {
                            if (debtController.isPatentDoc.value) {
                              step3local.patentDoc = 1;
                            } else {
                              step3local.patentDoc = 0;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomSelect2GetFunding(
                        isMultipleSelect: true,
                        title: 'Company’s MOC Certificate',
                        isSelect: debtController.isCertificate.value,
                        ontap: () {
                          debtController.isCertificate.value =
                              !debtController.isCertificate.value;
                          setState(() {
                            if (debtController.isCertificate.value) {
                              step3local.mocCertificate = 1;
                            } else {
                              step3local.mocCertificate = 0;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomSelect2GetFunding(
                        isMultipleSelect: true,
                        title: 'Company’s License Document',
                        isSelect: debtController.isLicense.value,
                        ontap: () {
                          debtController.isLicense.value =
                              !debtController.isLicense.value;
                          setState(() {
                            if (debtController.isLicense.value) {
                              step3local.licenceDoc = 1;
                            } else {
                              step3local.licenceDoc = 0;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomSelect2GetFunding(
                        isMultipleSelect: true,
                        title:
                            'Company’s Memorandum And Article Of \n Association',
                        isSelect: debtController.isMemorandum.value,
                        ontap: () {
                          debtController.isMemorandum.value =
                              !debtController.isMemorandum.value;

                          setState(() {
                            if (debtController.isMemorandum.value) {
                              step3local.memorandum = 1;
                            } else {
                              step3local.memorandum = 0;
                            }
                          });
                          debugPrint(
                              "Company MAA locale selected:${step3local.memorandum}");
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          )),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isDisable: false,
                    isOutline: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Close',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    isDisable: false,
                    isOutline: false,
                    onPressed: step3local == step3Defual &&
                            step3local.memorandum ==
                                debtController.memorandumDoc.value
                        ? null
                        : () {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                "Debt Edit CompanyInfo Preview Form");
                            _onpressPersonalInfo(
                              context,
                              step3local.companyName!,
                              step3local.address!,
                              step3local.yearOfEstablishment!,
                              step3local.typeOfOrganization!,
                              step3local.industry!,
                              step3local.taxIdentificationNumber!,
                              step3local.numberOfStaff!,
                              step3local.ownerName!,
                              step3local.productSevice!,
                              step3local.patentDoc!,
                              step3local.mocCertificate!,
                              step3local.licenceDoc!,
                              step3local.memorandum!,
                            );
                          },
                    title: 'Save',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
