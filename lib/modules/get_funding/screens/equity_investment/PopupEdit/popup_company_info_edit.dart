import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../Utils/helper/color.dart';
import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../../widgets/get_funding/custom_select_2_getfunding.dart';
import '../../../../member_directory/controllers/member_controller.dart';
import '../../../controller/equity_investment_controller.dart';

class PopupCompanyInfo extends StatefulWidget {
  const PopupCompanyInfo({Key? key, this.step2Defual, this.reuslt})
      : super(key: key);
  final Function? reuslt;
  final Step2EquityModel? step2Defual;
  @override
  State<PopupCompanyInfo> createState() => _PopupCompanyInfoState();
}

class _PopupCompanyInfoState extends State<PopupCompanyInfo> {
  final memberController = Get.put(MemberController());
  final equityController = Get.put(EquityInvestmentController());
  Step2EquityModel step2local = Step2EquityModel();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  TextEditingController taxcontroller = TextEditingController();
  TextEditingController numberofstaffcontroller = TextEditingController();
  TextEditingController ownernamecontroller = TextEditingController();
  TextEditingController productcontroller = TextEditingController();
  // List pocDoc = [];
  // List mocCertificate = [];
  // List licenceDoc = [];
  // int? patentDoc, mocCertificates, licenceDocu, memorandom;
  bool? isValCompanyName,
      isValAddress,
      isValYearOfEstablishment,
      isValTypeOfOrganization,
      isValIndustry,
      isValNumberOfStaff,
      isValOwnerName,
      isValProductService;

  final optionController = Get.put(DocumentCategory());
  onLocalClear() {
    step2local.companyName = "";
    step2local.address = "";
    step2local.yearOfEstablishment = "";
    // step2local.typeOfOrganization = null;
    step2local.typeOfOrganization!.display = null;
    // step2local.typeOfOrganization!.id = null;
    step2local.taxIdentificationNumber = "";
    step2local.industry!.display = null;
    step2local.industry!.id = null;
    step2local.numberOfStaff = "";
    step2local.ownerName = "";
    step2local.productSevice = "";
    step2local.companyPatentDoc = 0;
    step2local.companyMocCertificate = 0;
    step2local.companyLicence = 0;
    step2local.companyMemorandum = 0;
    addresscontroller.text = "";
    yearcontroller.text = "";
    taxcontroller.text = "";
    numberofstaffcontroller.text = "";

    ownernamecontroller.text = "";
    productcontroller.text = "";
    equityController.isPatentDoc.value = false;
    equityController.isCertificate.value = false;
    equityController.isMemorandum.value = false;
    equityController.isLicense.value = false;
  }

  @override
  void initState() {
    step2local = Step2EquityModel(
        companyName: widget.step2Defual!.companyName,
        address: widget.step2Defual!.address,
        yearOfEstablishment: widget.step2Defual!.yearOfEstablishment,
        typeOfOrganization: widget.step2Defual!.typeOfOrganization,
        taxIdentificationNumber: widget.step2Defual!.taxIdentificationNumber,
        industry: widget.step2Defual!.industry,
        numberOfStaff: widget.step2Defual!.numberOfStaff,
        ownerName: widget.step2Defual!.ownerName,
        productSevice: widget.step2Defual!.productSevice,
        companyPatentDoc: widget.step2Defual!.companyPatentDoc,
        companyMocCertificate: widget.step2Defual!.companyMocCertificate,
        companyLicence: widget.step2Defual!.companyLicence,
        companyMemorandum: widget.step2Defual!.companyMemorandum);
    addresscontroller.text = step2local.address!;
    yearcontroller.text = step2local.yearOfEstablishment!;
    taxcontroller.text = step2local.taxIdentificationNumber!;

    ///
    var displaynumberofstaffcontroller =
        FormatNumber.formatNumberDefualt(int.parse(step2local.numberOfStaff!));
    numberofstaffcontroller.text = displaynumberofstaffcontroller;

    ///
    ownernamecontroller.text = step2local.ownerName!;
    productcontroller.text = step2local.productSevice!;
    debugPrint(
        "equityController.applicationData.value.id :${equityController.applicationData.value.id}");
    if (equityController.applicationData.value.id != null) {
      onCompanyOptionInit();
    }
    super.initState();
  }

  onCompanyOptionInit() {
    if (equityController.patentDocument.value == 1) {
      equityController.isPatentDoc.value = true;
    } else {
      equityController.isPatentDoc.value = false;
    }
    if (equityController.certificatioDoc.value == 1) {
      equityController.isCertificate.value = true;
    } else {
      equityController.isCertificate.value = false;
    }
    if (equityController.licenseDoc.value == 1) {
      equityController.isLicense.value = true;
    } else {
      equityController.isLicense.value = false;
    }
    if (equityController.memorandumDoc.value == 1) {
      equityController.isMemorandum.value = true;
    } else {
      equityController.isMemorandum.value = false;
    }
  }

  _onpressPersonalInfo(
    context,
    String companyName,
    String adress,
    String year,
    Optionmodel type,
    Optionmodel industry,
    String tax,
    String numberofstaff,
    String ownername,
    String productandsevice,
    int patentDoc,
    int mocCertification,
    int licenseDoc,
    int memorandum,
  ) {
    if (companyName == '') {
      setState(() {
        isValCompanyName = false;
      });
    } else {
      isValCompanyName = true;
    }

    if (adress == '') {
      setState(() {
        isValAddress = false;
      });
    } else {
      isValAddress = true;
    }

    if (year == '') {
      setState(() {
        isValYearOfEstablishment = false;
      });
    } else {
      isValYearOfEstablishment = true;
    }

    if (type.display == null) {
      setState(() {
        isValTypeOfOrganization = false;
      });
    } else {
      isValTypeOfOrganization = true;
    }

    if (industry.display == null) {
      setState(() {
        isValIndustry = false;
      });
    } else {
      isValIndustry = true;
    }

    if (numberofstaff == '') {
      setState(() {
        isValNumberOfStaff = false;
      });
    } else {
      isValNumberOfStaff = true;
    }

    if (ownername == '') {
      setState(() {
        isValOwnerName = false;
      });
    } else {
      isValOwnerName = true;
    }

    if (productandsevice == '') {
      setState(() {
        isValProductService = false;
      });
    } else {
      isValProductService = true;
    }

    if (productandsevice != '' &&
        ownername != '' &&
        numberofstaff != '' &&
        industry.display != null &&
        type.display != null &&
        year != '' &&
        adress != '' &&
        companyName != '') {
      equityController.companyName.value = companyName;
      equityController.address.value = adress;
      equityController.addresscontroller.text = adress;
      equityController.yearOfEstablishment.value = year;
      yearcontroller.text = year;
      equityController.typeOfOrganization.value = type;
      equityController.industry.value = industry;
      equityController.numberOfStaff.value = numberofstaff.toString();
      numberofstaffcontroller.text = numberofstaff.toString();
      equityController.ownerName.value = ownername;
      ownernamecontroller.text = ownername;
      equityController.productSevice.value = productandsevice;
      productcontroller.text = productandsevice;
      equityController.taxIdentificationNumber.value = tax;
      taxcontroller.text = tax;
      equityController.patentDocument.value = patentDoc;
      equityController.licenseDoc.value = licenseDoc;
      equityController.certificatioDoc.value = mocCertification;
      equityController.memorandumDoc.value = memorandum;

      Navigator.pop(context);
    }
  }

  final addressFocus = FocusNode();
  final yearofFocus = FocusNode();
  final numberofFocus = FocusNode();
  final ownernameFocus = FocusNode();
  final productFocus = FocusNode();
  final taxFocus = FocusNode();
  TextEditingController addNewOtherType = TextEditingController();
  TextEditingController addNewOtherIndustry = TextEditingController();

  void resetAllValidation() {
    isValProductService = true;
    isValCompanyName = true;
    isValYearOfEstablishment = true;
    isValNumberOfStaff = true;
    isValOwnerName = true;
    isValTypeOfOrganization = true;
    isValIndustry = true;
    isValAddress = true;
    // equityController.isValYearOfEstablishment(true);
  }

  // @override
  // void dispose() {
  //   resetAllValidation();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Listener(
                onPointerDown: (PointerDownEvent event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        memberController.companyDataList.isNotEmpty &&
                                memberController.addCompany.value == false
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: CICDropdown(
                                  colors: Colors.white,
                                  isCompany: true,
                                  onCreateCompany: () {
                                    Navigator.pop(context);
                                    memberController.addCompany.value = true;
                                    onLocalClear();
                                    memberController.update();
                                  },
                                  isValidate: isValCompanyName,
                                  item: memberController.companyDataList
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    return DropDownItem(
                                      itemList: {
                                        "Name": e.value.companyName!,
                                        "Code": e.key.toString(),
                                        "Address": e.value.address ?? '',
                                        "Product":
                                            e.value.companyProductAndService!,
                                        "Tax":
                                            e.value.taxIdentificationNumber ??
                                                '',
                                        "Year": e.value.yearFounded,
                                        "Typeid":
                                            e.value.typeOfOrganization != null
                                                ? e.value.typeOfOrganization!.id
                                                    .toString()
                                                : '0',
                                        "TypeDis":
                                            e.value.typeOfOrganization != null
                                                ? e.value.typeOfOrganization!
                                                    .display
                                                : null,
                                        "Industryid": e.value.industry != null
                                            ? e.value.industry!.id.toString()
                                            : '0',
                                        "IndustryDis": e.value.industry != null
                                            ? e.value.industry!.display
                                            : null,
                                        "NumberOfStaff":
                                            e.value.numberOfStaff != null
                                                ? e.value.numberOfStaff
                                                            .toString() ==
                                                        '0'
                                                    ? ''
                                                    : e.value.numberOfStaff
                                                        .toString()
                                                : '',
                                        "OwnerName": e.value.ownerName ?? '',
                                        "patent": e.value.companyFiles != null
                                            ? e.value.companyFiles!
                                                .companyPatentDoc
                                            : [],
                                        "moc": e.value.companyFiles != null
                                            ? e.value.companyFiles!
                                                .companyMoCCertificate
                                            : [],
                                        "licence": e.value.companyFiles != null
                                            ? e.value.companyFiles!
                                                .companyLicenceDoc
                                            : []
                                      },
                                    );
                                  }).toList(),
                                  onChange: (v) {
                                    setState(() {
                                      step2local.companyName = v["Name"];
                                      step2local.address = v["Address"];
                                      addresscontroller.text = v["Address"];
                                      step2local.productSevice = v["Product"];
                                      productcontroller.text = v["Product"];
                                      step2local.yearOfEstablishment =
                                          v["Year"];
                                      yearcontroller.text = v["Year"];
                                      step2local.taxIdentificationNumber =
                                          v["Tax"];
                                      taxcontroller.text = v["Tax"];
                                      step2local.numberOfStaff =
                                          v["NumberOfStaff"];

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
                                      step2local.ownerName = v["OwnerName"];
                                      ownernamecontroller.text = v["OwnerName"];
                                      step2local.typeOfOrganization =
                                          Optionmodel(
                                              id: int.parse(v['Typeid']),
                                              display: v['TypeDis']);
                                      step2local.industry = Optionmodel(
                                          id: int.parse(v['Industryid']),
                                          display: v['IndustryDis']);
                                      resetAllValidation();
                                    });
                                  },
                                  label: 'Company Name',
                                  defaultValue: step2local.companyName != ''
                                      ? {
                                          "Name": step2local.companyName,
                                          "Code": 0
                                        }
                                      : null,
                                ),
                              )
                            : CustomTextFieldNew(
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(addressFocus);
                                },
                                isRequired: true,
                                isValidate: isValCompanyName,
                                labelText: 'Company Name',
                                hintText: 'Company Name',
                                onChange: (value) {
                                  isValCompanyName = true;
                                  setState(() {
                                    if (value.isEmpty) {
                                      step2local.companyName = '';
                                    } else {
                                      step2local.companyName = value;
                                    }
                                  });
                                },
                                initialValue: step2local.companyName,
                              ),
                        CustomTextFieldNew(
                          controller: addresscontroller,
                          focusScope: addressFocus,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(yearofFocus);
                          },
                          isRequired: true,
                          isValidate: isValAddress,
                          labelText: 'Address',
                          hintText: 'Address',
                          onChange: (value) {
                            if (value.isEmpty) {
                              isValAddress = false;
                              step2local.address = '';
                            } else {
                              isValAddress = true;
                              step2local.address = value;
                            }
                            setState(() {});
                          },
                          initialValue: step2local.address,
                        ),

                        CustomTextFieldNew(
                          maxlenght: 4,
                          keyboardType: TextInputType.number,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                          ],
                          autoFocus: memberController.addCompany.value,
                          controller: yearcontroller,
                          textInputAction: TextInputAction.next,
                          isRequired: true,
                          isValidate:
                              equityController.isValYearOfEstablishment.value,
                          labelText: 'Year of Establishment',
                          hintText: 'Year of Establishment',
                          onChange: (value) {
                            if (value.isEmpty) {
                              equityController.isValYearOfEstablishment.value =
                                  false;
                            } else {
                              step2local.yearOfEstablishment = value;
                              equityController.isValYearOfEstablishment.value =
                                  true;
                            }
                            setState(() {});
                          },
                          initialValue: step2local.yearOfEstablishment,
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
                                  step2local.typeOfOrganization = Optionmodel(
                                      display: addNewOtherType.text, id: null);
                                });
                                if (addNewOtherType.text != "") {
                                  equityController.typeOfOrganization.value.id =
                                      null;
                                }
                                Navigator.pop(context);
                              },
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
                          isValidate: isValTypeOfOrganization,
                          item: optionController.optionData.value.organization!
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
                              step2local.typeOfOrganization = Optionmodel(
                                  display: v["Name"], id: int.parse(v["Code"]));
                            });
                            isValTypeOfOrganization = true;
                          },
                          label: 'Type of Organization',
                          defaultValue:
                              step2local.typeOfOrganization!.display != null
                                  ? {
                                      "Name": step2local
                                          .typeOfOrganization!.display,
                                      "Code": step2local.typeOfOrganization!.id
                                    }
                                  : null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldNew(
                          controller: taxcontroller,
                          focusScope: taxFocus,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(numberofFocus);
                          },
                          labelText: 'Tax Identification Number (TIN)',
                          hintText: 'Tax Identification Number (TIN)',
                          onChange: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                step2local.taxIdentificationNumber = '';
                              } else {
                                step2local.taxIdentificationNumber = value;
                              }
                            });
                          },
                          initialValue: step2local.taxIdentificationNumber,
                        ),
                        CICDropdown(
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
                                  step2local.industry = Optionmodel(
                                      display: addNewOtherIndustry.text,
                                      id: null);
                                });
                                if (addNewOtherType.text != "") {
                                  equityController.industry.value.id = null;
                                }
                                Navigator.pop(context);
                              },
                              context: context,
                              textFieldHere: CustomTextFieldNew(
                                controller: addNewOtherIndustry,
                                hintText: 'Type of organization',
                                labelText: 'Type of organization',
                              ),
                            );
                          },
                          otherLabel: "Add Other",
                          isCompany: true,
                          colors: Colors.white,
                          defaultValue: step2local.industry!.display != null
                              ? {
                                  "Name": step2local.industry!.display,
                                  "Code": step2local.industry!.id
                                }
                              : null,
                          isValidate: isValIndustry,
                          item: optionController.optionData.value.industry!
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
                              step2local.industry = Optionmodel(
                                  display: v["Name"], id: int.parse(v["Code"]));
                            });
                            isValIndustry = true;
                          },
                          label: 'Industry',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //===
                        CustomTextFieldNew(
                          autoFocus: memberController.addCompany.value,
                          controller: numberofstaffcontroller,
                          isRequired: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            NumericTextFormatter()
                          ],
                          isValidate: equityController.isValNumberOfStaff.value,
                          labelText: 'Number of Staff',
                          hintText: 'Number of Staff',
                          onChange: (valueChanged) {
                            var value = valueChanged.replaceAll(',', '');
                            if (value.isEmpty) {
                              equityController.isValNumberOfStaff.value = false;
                              step2local.numberOfStaff = "0";
                            } else {
                              step2local.numberOfStaff = value;
                              equityController.isValNumberOfStaff.value = true;
                            }
                            setState(() {});
                          },
                          initialValue: step2local.numberOfStaff.toString(),
                        ),

                        CustomTextFieldNew(
                          controller: ownernamecontroller,
                          focusScope: ownernameFocus,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(productFocus);
                          },
                          isRequired: true,
                          isValidate: isValOwnerName,
                          labelText: 'Owner Name',
                          hintText: 'Owner Name',
                          onChange: (value) {
                            isValOwnerName = true;
                            setState(() {
                              if (value.isEmpty) {
                                step2local.ownerName = '';
                              } else {
                                step2local.ownerName = value;
                              }
                            });
                          },
                          initialValue: step2local.ownerName,
                        ),
                        CustomTextFieldNew(
                          controller: productcontroller,
                          focusScope: productFocus,
                          isRequired: true,
                          isValidate: isValProductService,
                          labelText: 'Product / Service',
                          hintText: 'Product / Service',
                          onChange: (value) {
                            isValProductService = true;
                            setState(() {
                              if (value.isEmpty) {
                                step2local.productSevice = '';
                              } else {
                                step2local.productSevice = value;
                              }
                            });
                          },
                          initialValue: step2local.productSevice,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Which of the following legal documents that you have? (Multiple selections)',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
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
                                isSelect: equityController.isPatentDoc.value,
                                ontap: () {
                                  equityController.isPatentDoc.value =
                                      !equityController.isPatentDoc.value;
                                  setState(() {
                                    if (equityController.isPatentDoc.value) {
                                      step2local.companyPatentDoc = 1;
                                    } else {
                                      step2local.companyPatentDoc = 0;
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
                                isSelect: equityController.isCertificate.value,
                                ontap: () {
                                  equityController.isCertificate.value =
                                      !equityController.isCertificate.value;
                                  setState(() {
                                    if (equityController.isCertificate.value) {
                                      step2local.companyMocCertificate = 1;
                                    } else {
                                      step2local.companyMocCertificate = 0;
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
                                isSelect: equityController.isLicense.value,
                                ontap: () {
                                  equityController.isLicense.value =
                                      !equityController.isLicense.value;
                                  setState(() {
                                    if (equityController.isLicense.value) {
                                      step2local.companyLicence = 1;
                                    } else {
                                      step2local.companyLicence = 0;
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
                                isSelect: equityController.isMemorandum.value,
                                ontap: () {
                                  equityController.isMemorandum.value =
                                      !equityController.isMemorandum.value;
                                  //check if else make sure value in ontap is ture when we have API
                                  setState(() {
                                    if (equityController.isMemorandum.value) {
                                      step2local.companyMemorandum = 1;
                                      debugPrint(
                                          "Is Selected Company’s Memorandum:1");
                                    } else {
                                      step2local.companyMemorandum = 0;
                                      debugPrint(
                                          "Is Selected Company’s Memorandum:0");
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: AppColor.dividerBackground,
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                    title: 'Cancel',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    isDisable: false,
                    isOutline: false,
                    onPressed: step2local == widget.step2Defual &&
                            step2local.companyPatentDoc ==
                                widget.step2Defual!.companyPatentDoc &&
                            step2local.companyMocCertificate ==
                                widget.step2Defual!.companyMocCertificate &&
                            step2local.companyLicence ==
                                widget.step2Defual!.companyLicence &&
                            step2local.companyMemorandum ==
                                widget.step2Defual!.companyMemorandum
                        ? null
                        : () {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                "Equity Edit CompanyInfo Preview Form");
                            _onpressPersonalInfo(
                                context,
                                step2local.companyName!,
                                step2local.address!,
                                step2local.yearOfEstablishment!,
                                step2local.typeOfOrganization!,
                                step2local.industry!,
                                step2local.taxIdentificationNumber!,
                                step2local.numberOfStaff!,
                                step2local.ownerName!,
                                step2local.productSevice!,
                                step2local.companyPatentDoc!,
                                step2local.companyMocCertificate!,
                                step2local.companyLicence!,
                                step2local.companyMemorandum!);
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
