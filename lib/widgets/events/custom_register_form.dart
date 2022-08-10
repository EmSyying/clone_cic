import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRegisterForm extends StatefulWidget {
  final int? eventID;

  const CustomerRegisterForm({Key? key, this.eventID}) : super(key: key);
  @override
  State<CustomerRegisterForm> createState() => _CustomerRegisterFormState();
}

class _CustomerRegisterFormState extends State<CustomerRegisterForm> {
  final customerController = Get.put(CustomerController());
  final registerMemberController = Get.put(EventController());
  final _formKey = GlobalKey<FormState>();
  final fullNameKey = GlobalKey();
  final positionKey = GlobalKey();
  final companyNameKey = GlobalKey();
  final phoneNumberKey = GlobalKey();
  final emailKey = GlobalKey();
  bool? isValidatefullName;
  bool? isValidatedPosition;
  bool? isValidatedCompanyName;
  bool? isValidatedPhoneNubmer;
  bool? isValidatedEmail;

  bool isValidate() {
    if (customerController.customer.value.fullName == "") {
      setState(() {
        isValidatefullName = false;
      });
      Scrollable.ensureVisible(fullNameKey.currentContext!);
      return false;
    } else if (customerController.customer.value.position!.display == "") {
      setState(() {
        isValidatedPosition = false;
      });
      Scrollable.ensureVisible(positionKey.currentContext!);
      return false;
    } else if (customerController.customer.value.company == "") {
      setState(() {
        isValidatedCompanyName = false;
      });
      Scrollable.ensureVisible(companyNameKey.currentContext!);
      return false;
    } else if (customerController.customer.value.phone == "") {
      setState(() {
        isValidatedPhoneNubmer = false;
      });
      Scrollable.ensureVisible(phoneNumberKey.currentContext!);
      return false;
    } else if (customerController.customer.value.email == "") {
      setState(() {
        isValidatedEmail = false;
      });
      Scrollable.ensureVisible(emailKey.currentContext!);
      return false;
    }
    if (customerController.customer.value.fullName == "") {
      setState(() {
        isValidatefullName = false;
      });
      return false;
    }
    if (customerController.customer.value.position!.display! == "") {
      setState(() {
        isValidatedPosition = false;
      });
      return false;
    }
    if (customerController.customer.value.company == "") {
      setState(() {
        isValidatedCompanyName = false;
      });
      return false;
    }
    if (customerController.customer.value.phone == "") {
      setState(() {
        isValidatedPhoneNubmer = false;
      });
      return false;
    }
    if (customerController.customer.value.email == "") {
      setState(() {
        isValidatedEmail = false;
      });
      return false;
    }

    return true;
  }

  @override
  void initState() {
    customerController.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => customerController.isloading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFieldNew(
                            key: fullNameKey,
                            isValidate: isValidatefullName,
                            hintText: "Full Name",
                            labelText: "Full Name",
                            isRequired: true,
                            initialValue:
                                customerController.customer.value.fullName!,
                            onChange: (value) {
                              if (value == "") {
                                setState(() {
                                  isValidatefullName = false;
                                });
                              } else {
                                setState(() {
                                  customerController.customer.value.fullName =
                                      value;
                                  isValidatefullName = true;
                                });
                              }
                            },
                            onSave: (value) {
                              if (value! == '') {
                                customerController.customer.value.fullName!;
                              } else {
                                customerController.customer.value.fullName =
                                    value;
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            key: positionKey,
                            isValidate: isValidatedPosition,
                            hintText: "Position",
                            labelText: "Position",
                            isRequired: true,
                            initialValue: customerController
                                .customer.value.position!.display!,
                            onChange: (value) {
                              if (value == "") {
                                setState(() {
                                  isValidatedPosition = false;
                                });
                              } else {
                                setState(() {
                                  customerController
                                      .customer.value.position!.display = value;
                                  isValidatedPosition = true;
                                });
                              }
                            },
                            onSave: (value) {
                              if (value! == '') {
                                customerController
                                    .customer.value.position!.display!;
                              } else {
                                customerController
                                    .customer.value.position!.display = value;
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            key: companyNameKey,
                            isValidate: isValidatedCompanyName,
                            hintText: "Company",
                            labelText: "Company",
                            isRequired: true,
                            initialValue:
                                customerController.customer.value.company!,
                            onChange: (value) {
                              if (value == "") {
                                setState(() {
                                  isValidatedCompanyName = false;
                                });
                              } else {
                                setState(() {
                                  customerController.customer.value.company =
                                      value;
                                  isValidatedCompanyName = true;
                                });
                              }
                            },
                            onSave: (value) {
                              if (value! == '') {
                                customerController.customer.value.company!;
                              } else {
                                customerController.customer.value.company =
                                    value;
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            key: phoneNumberKey,
                            isValidate: isValidatedPhoneNubmer,
                            hintText: "Phone Number",
                            labelText: "Phone Number",
                            isRequired: true,
                            initialValue:
                                customerController.customer.value.phone!,
                            onChange: (value) {
                              if (value == "") {
                                setState(() {
                                  isValidatedPhoneNubmer = false;
                                });
                              } else {
                                setState(() {
                                  customerController.customer.value.phone =
                                      value;
                                  isValidatedPhoneNubmer = true;
                                });
                              }
                            },
                            onSave: (value) {
                              if (value == '') {
                                customerController.customer.value.phone!;
                              } else {
                                customerController.customer.value.phone = value;
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            key: emailKey,
                            isValidate: isValidatedEmail,
                            hintText: "Email",
                            labelText: "Email",
                            isRequired: true,
                            initialValue:
                                customerController.customer.value.email!,
                            onChange: (value) {
                              if (value == "") {
                                setState(() {
                                  isValidatedEmail = false;
                                });
                              } else {
                                setState(() {
                                  customerController.customer.value.email =
                                      value;
                                  isValidatedEmail = true;
                                });
                              }
                            },
                            onSave: (value) {
                              if (value == '') {
                                customerController.customer.value.email!;
                              } else {
                                customerController.customer.value.email =
                                    value!;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        right: 15.0, top: 20.0, bottom: 25.0, left: 15.0),
                    child: CustomButton(
                        title: "Submit",
                        isOutline: false,
                        isDisable: false,
                        onPressed: () async {
                          setState(() {
                            _formKey.currentState!.save();
                          });
                          if (isValidate()) {
                            registerMemberController.onRegisterEvents(
                              context: context,
                              eventID: widget.eventID!,
                            );
                          }

                          // Navigator.pop(context);
                          registerMemberController.fullName.value = '';
                          registerMemberController.positionMember.value = '';
                          registerMemberController.companyNameMember.value = '';
                          registerMemberController.phoneNumberMember.value = '';
                          registerMemberController.emailMember.value = '';
                        }),
                  ),
                )
              ],
            ),
    );
  }
}
