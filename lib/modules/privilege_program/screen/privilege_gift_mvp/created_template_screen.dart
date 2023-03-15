import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';

class CreateTemplateScreen extends StatelessWidget {
  const CreateTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                                          color:
                                              Theme.of(context).primaryColor),
                                      image: const DecorationImage(
                                        image: NetworkImage(''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ' widget',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(fontSize: 30),
                                      ),
                                    ))
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
        body: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: Column(
            children: [
              CustomTextFieldNew(
                keyboardType: TextInputType.number,
                isRequired: true,
                hintText: 'Enter receive number',
                onChange: (phone) {},
                isValidate: true,
                labelText: 'Enter receive number',
              ),
              CustomTextFieldNew(
                keyboardType: TextInputType.name,
                hintText: 'Create Template',
                onChange: (phone) {},
                isValidate: true,
                labelText: 'Create Template',
                isReadOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Container backgroundTemplated(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         stops: const [0.4, 0.8],
  //         begin: Alignment.topCenter,
  //         end: Alignment.center,
  //         colors: [Theme.of(context).primaryColor, Colors.white24],
  //       ),
  //     ),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(),
  //       child: Stack(
  //         children: [
  //           Container(
  //             // color: Theme.of(context).primaryColor,
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 stops: const [0.6, 0.9],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.center,
  //                 colors: [Theme.of(context).primaryColor, Colors.white],
  //               ),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 40),
  //               child: BackdropFilter(
  //                 filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
  //                 child: Container(
  //                   padding: const EdgeInsets.only(top: 60),
  //                   width: double.infinity,
  //                   decoration: BoxDecoration(
  //                     borderRadius: const BorderRadius.only(
  //                       topLeft: Radius.circular(25),
  //                       topRight: Radius.circular(25),
  //                     ),
  //                     color: Colors.white.withOpacity(0.5),
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       Text(
  //                         'Upload Profile Picture',
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .displaySmall!
  //                             .copyWith(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w400,
  //                             ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           //upload Profile
  //           Positioned(
  //             top: 0,
  //             left: 0,
  //             right: 0,
  //             child: Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 Container(
  //                   width: 88.0,
  //                   height: 88.0,
  //                   decoration: const BoxDecoration(
  //                     color: Colors.white,
  //                     shape: BoxShape.circle,
  //                   ),
  //                   // child: CircularProgressIndicator(
  //                   //   strokeWidth: 4,
  //                   //   color: Theme.of(context).primaryColor,
  //                   // ),
  //                 ),
  //                 Container(
  //                     height: 85,
  //                     width: 85,
  //                     decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       border: Border.all(
  //                           width: 3.5, color: Theme.of(context).primaryColor),
  //                       image: const DecorationImage(
  //                         image: NetworkImage(''),
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         ' widget',
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .titleLarge!
  //                             .copyWith(fontSize: 30),
  //                       ),
  //                     ))
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //}
}
