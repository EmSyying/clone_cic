import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/Utils/function/format_account_number.dart';
import 'package:cicgreenloan/Utils/helper/custom_loading_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/function/format_date_time.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../controller/privilege_controller.dart';

class CreateTemplateScreen extends StatefulWidget {
  final int? templatId;
  final String? templateImg;
  final String? recieverWalletNumber;
  final String? templateName;
  final String? defaultImage;
  final String? color;
  const CreateTemplateScreen({
    super.key,
    this.templatId,
    this.templateImg,
    this.recieverWalletNumber,
    this.templateName,
    this.defaultImage,
    this.color,
  });

  @override
  State<CreateTemplateScreen> createState() => _CreateTemplateScreenState();
}

class _CreateTemplateScreenState extends State<CreateTemplateScreen> {
  File? image;
  // XFile? xfile;
  String getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  void selectImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    final name = getFileExtension(file!.name);
    image = File(file.path);

    final bytefile = File(file.path).readAsBytesSync();
    String base64String = "data:image/$name;base64,${base64Encode(bytefile)}";
    setState(() {});

    // final byte = await file?.readAsBytes();

    // final base64Image = base64Encode(byte!);

    privilegeController.templateImage = base64String;

    debugPrint('Image data for Submit : $base64String');
  }

  final privilegeController = Get.put(PrivilegeController());

  @override
  void dispose() {
    privilegeController.clearGiftMVPForm();
    super.dispose();
  }

  _initValue() {
    if (widget.templatId != null) {
      debugPrint('Update');
      var wallet = widget.recieverWalletNumber ?? '';
      wallet = wallet.replaceAll(" | MVP", "").removeAllWhitespace;
      // wallet.
      debugPrint("wallet==$wallet");
      privilegeController.receiveWalletNumberController.text =
          FormatDate.formatAccountNumber(wallet).toString();
      privilegeController.templatRecieverNameController.text =
          widget.templateName ?? '';
      privilegeController.inputRecieverWalletChanged(
          privilegeController.receiveWalletNumberController.text);
    }
  }

  @override
  void initState() {
    // debugPrint(
    //     'Image : ${widget.templateImg} => ${widget.templateImg.runtimeType}');

    _initValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: widget.templatId == null ? 'Create Template' : 'Edit Template',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: kIsWeb
              ? const Icon(Icons.arrow_back)
              : Platform.isAndroid
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                excludeHeaderSemantics: true,
                backgroundColor: Theme.of(context).primaryColor,
                leading: const Text(''),
                expandedHeight: 170,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  centerTitle: false,
                  //created Template
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: const [0.4, 0.8],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.white24
                        ],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(),
                      child: Stack(
                        children: [
                          Container(
                            // color: Theme.of(context).primaryColor,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: const [0.6, 0.9],
                                begin: Alignment.topCenter,
                                end: Alignment.center,
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Colors.white
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 60),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //Select Picture
                                          selectImage();
                                        },
                                        child: Text(
                                          'Upload Profile Picture',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //upload Profile
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectImage();
                                  },
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    width: 88.0,
                                    height: 88.0,
                                    decoration: BoxDecoration(
                                      color: widget.color == null
                                          ? Colors.white
                                          : Color(int.parse(widget.color!)),
                                      shape: BoxShape.circle,
                                    ),
                                    child: image != null
                                        ? Image.file(
                                            image!,
                                            fit: BoxFit.cover,
                                          )
                                        : widget.templateImg != null &&
                                                widget.templateImg != ''
                                            ? Image.network(
                                                widget.templateImg ?? "",
                                                fit: BoxFit.cover,
                                              )
                                            : Center(
                                                child: Text(
                                                  widget.defaultImage ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 25,
                                                      ),
                                                ),
                                              ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Obx(() {
          debugPrint('========');
          return Container(
            alignment: Alignment.topCenter,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFieldNew(
                        noDisableColor: widget.templatId != null,
                        enable: widget.templatId == null,
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        initialValue: privilegeController
                            .receiveWalletNumberController.text,
                        isValidate: privilegeController
                            .isGiftMVPVerifyAccountValidate.value,
                        validateText: privilegeController
                            .isGiftMVPVerifyAccountValidateMessage.value,
                        controller:
                            privilegeController.receiveWalletNumberController,
                        inputFormatterList: [
                          FilteringTextInputFormatter.digitsOnly,
                          AccountNumberFormatter()
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                          signed: false,
                        ),
                        isRequired: widget.templatId == null,
                        labelText: 'Receiver Wallet Number',
                        hintText: 'Receiver Wallet Number',
                        onChange:
                            privilegeController.inputRecieverWalletChanged,
                        errorWidget: privilegeController
                                    .isGiftMVPVerifyAccountValidate.value &&
                                privilegeController
                                    .receiveWalletNumber.isNotEmpty &&
                                privilegeController
                                    .receiverWalletName.isNotEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/wallet_found.svg',
                                      height: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      privilegeController
                                          .receiverWalletName.value,
                                      style: const TextStyle(
                                          fontSize: 10.5,
                                          color: Color(0xff4FA30F)),
                                    )
                                  ],
                                ),
                              )
                            : null,
                      ),
                      SizedBox(
                          height: privilegeController
                                  .isGiftMVPVerifyAccountValidate.value
                              ? 10
                              : 0),
                      CustomTextFieldNew(
                        controller:
                            privilegeController.templatRecieverNameController,
                        keyboardType: TextInputType.name,
                        hintText: 'Template Name',
                        onChange: (name) {
                          privilegeController.templateName.value = name;
                        },
                        isValidate: true,
                        labelText: 'Template Name',
                        initialValue: privilegeController
                            .templatRecieverNameController.text,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 30.0,
                  ),
                  child: privilegeController.loadingCreateTemplate.value
                      ? const CustomLoadingButton()
                      : CustomButton(
                          width: double.infinity,
                          onPressed: () async {
                            if (widget.templatId != null) {
                              await privilegeController.updatedTemplate(
                                  context, widget.templatId!);
                            } else {
                              await privilegeController
                                  .createTemplateChooseTemplateOption(
                                context,
                              );
                            }

                            debugPrint(
                                'review numbwer========${privilegeController.receiveAccountname.value}');
                          },
                          title: 'Save',
                          isDisable: !(privilegeController
                                  .isGiftMVPVerifyAccountValidate.value &&
                              privilegeController
                                  .receiverWalletName.value.isNotEmpty),
                          isOutline: false,
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
