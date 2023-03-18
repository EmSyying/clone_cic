import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../controller/privilege_controller.dart';

class CreateTemplateScreen extends StatelessWidget {
  const CreateTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final priCon = Get.put(PrivilegeController());
    priCon.onRedeemToVerifyAccount(context);
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Create Template',
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
                                      Text(
                                        'Upload Profile Picture',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
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
                                Container(
                                  width: 88.0,
                                  height: 88.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  // child: CircularProgressIndicator(
                                  //   strokeWidth: 4,
                                  //   color: Theme.of(context).primaryColor,
                                  // ),
                                ),
                                Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3.5,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/privilege/image_template.svg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
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
                  child: Obx(
                    () => Column(
                      children: [
                        CustomTextFieldNew(
                          isValidate:
                              priCon.isRedeemToVerifyAccountValidate.value,
                          validateText: priCon
                              .isGiftMVPVerifyAccountValidateMessage.value,
                          initialValue: priCon.receiveAccountNumber.value,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: false),
                          isRequired: true,
                          autoFocus: false,
                          labelText: 'Receiver  Number',
                          hintText: 'Receiver  Number',
                          onChange: (value) async {
                            priCon.receiveAccountNumber.value = value;
                          },
                        ),
                        if (priCon.isRedeemToVerifyAccountValidate.value ==
                            true)
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20,
                                bottom: priCon.receiveAccountname.value != ''
                                    ? 10
                                    : 0,
                                right: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (priCon.receiveAccountname.value != '')
                                  SvgPicture.asset(
                                      'assets/images/wallet_found.svg'),
                                const SizedBox(width: 5),
                                if (priCon.receiveAccountname.value != '')
                                  Text(
                                    priCon.receiveAccountname.value,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff4FA30F)),
                                  )
                              ],
                            ),
                          ),
                        CustomTextFieldNew(
                          keyboardType: TextInputType.name,
                          hintText: 'Create Template',
                          onChange: (name) {
                            priCon.templateName.value = name;
                          },
                          isValidate: true,
                          labelText: 'Create Template',
                          initialValue: priCon.templateName.value,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 24.0),
                  child: CustomButton(
                    width: double.infinity,
                    onPressed: () async {
                      debugPrint('hany test create template====');
                      await priCon
                          .createTemplateChooseTemplateOption(context)
                          .then(
                            (value) => context.pop(),
                          );

                      debugPrint(
                          'review numbwer========${priCon.receiveAccountname.value}');
                    },
                    title: 'Save',
                    isDisable: false,
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
