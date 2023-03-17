import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../Utils/form_builder/custom_button.dart';
import '../../../widgets/custom_menu_holder.dart';

class ChooseGiftTemplateScreen extends StatelessWidget {
  const ChooseGiftTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Gift MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomFocusedMenuHolder(
              openWithTap: true,
              blurSize: 0,
              menuWidth: (MediaQuery.of(context).size.width * 0.6),
              blurBackgroundColor: Colors.grey[900]!.withOpacity(0.2),
              menuItems: [
                CustomFocusedMenuItem(
                    mainAxisAlignment: MainAxisAlignment.start,
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    title: Text(
                      "Transaction History",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                    leadingIcon: SvgPicture.asset(
                        "assets/images/transaction-history.svg")),
                CustomFocusedMenuItem(
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    mainAxisAlignment: MainAxisAlignment.start,
                    title: Text(
                      "Edit Template",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                    leadingIcon:
                        SvgPicture.asset("assets/images/edit-pencil.svg")),
                CustomFocusedMenuItem(
                    paddingBetweenItem: const EdgeInsets.only(right: 13),
                    mainAxisAlignment: MainAxisAlignment.start,
                    title: Text(
                      "Delete Template",
                      style: txtTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      if (Platform.isIOS) {
                        buildAlertIos(context, txtTheme);
                      } else {
                        buildAlertAndroid(context, txtTheme);
                      }
                    },
                    leadingIcon: SvgPicture.asset("assets/images/trash.svg"))
              ],
              onPressed: () {
                debugPrint('Hello');
              },
              child: SvgPicture.asset("assets/images/more-vertical.svg"),
            ),
          ),
        ],
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
      bottomNavigationBar: BottomNavigationBarButton(
        onPressed: () {},
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
                                  padding: const EdgeInsets.only(top: 55),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          'Champei Spa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '089 993 338 | MVP',
                                        style: TextStyle(
                                          color: Color(0xff848F92),
                                          fontSize: 12,
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
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 75,
                              width: 75,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.network(
                                "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/06/apple.png?auto=format&q=60&fit=max&w=930",
                                // fit: BoxFit.cover,
                              ),
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
        body: BodyWidget(txtTheme: txtTheme),
      ),
    );
  }
}

void buildAlertIos(context, TextTheme txtTheme) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 18),
        contentPadding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        title: Center(
          child: Text("Delete Template",
              style: txtTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontSize: 17,
              )),
        ),
        content: Text(
          "Are you sure you want to delete this template?",
          style: txtTheme.bodyMedium!.copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        actions: [
          Column(
            children: [
              Divider(
                color: Colors.grey.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: txtTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff007AFF)),
                      ),
                    ),
                  )),

              Divider(
                color: Colors.grey.withOpacity(.5),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Yes, Delete",
                        style: txtTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffED1E26)),
                      ),
                    ),
                  )),
              // TextButton(
              //   child: Text(
              //     "Yes, Delete",
              //     style: txtTheme.bodyMedium!.copyWith(
              //         fontSize: 17,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xffED1E26)),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          )
        ],
      );
    },
  );
}

void buildAlertAndroid(context, TextTheme txtTheme) {
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Delete Template",
          style: txtTheme.bodyMedium!.copyWith(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        content: Text(
          "Are you sure you want to delete this template?",
          style: txtTheme.bodyMedium!.copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              "Delete",
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

class BottomNavigationBarButton extends StatelessWidget {
  final void Function()? onPressed;
  const BottomNavigationBarButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: const Color(0xffFFFFFF), boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 1,
          )
        ]),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 34),
        child: CustomButton(
          isDisable: false,
          onPressed: onPressed,
          title: "Pay Now",
          isOutline: false,
          // backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    TextEditingController mvpBalanceTextController =
        TextEditingController(text: " ");
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFieldNew(
              enable: false,
              noDisableColor: true,
              // isReadOnly: true,
              controller: mvpBalanceTextController,
              prefix: RichText(
                text: TextSpan(
                  style: txtTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff848F92),
                    fontSize: 16,
                  ),
                  text: "023532433" " | ",
                  children: [
                    TextSpan(
                      style: txtTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      text: "1,000",
                    ),
                    TextSpan(
                      style: txtTheme.bodyMedium!.copyWith(
                          fontSize: 12, color: const Color(0xff848F92)),
                      text: "  " "MVP",
                    )
                  ],
                ),
              ),
              keyboardType: TextInputType.number,
              isRequired: false,
              // hintText: 'Enter receive number',
              onChange: (phone) {},
              isValidate: true,
              labelText: 'MVP Balance',
            ),
            CustomTextFieldNew(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 15, right: 10),
                child: Text("MVP",
                    style: txtTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xff848F92))),
              ),
              enable: true,
              isRequired: true,
              keyboardType: TextInputType.number,
              hintText: 'Amount',
              onChange: (phone) {},
              isValidate: true,
              labelText: 'Amount',
            ),
            CustomTextFieldNew(
              enable: true,
              isRequired: false,
              keyboardType: TextInputType.text,
              hintText: 'Remark',
              onChange: (phone) {},
              labelText: 'Remark',
            ),
          ],
        ),
      ),
    );
  }
}
