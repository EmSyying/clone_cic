import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressPickerWidget extends StatelessWidget {
  final bool? isValidate;
  final String? title;
  final GestureTapCallback? onTap;
  final String? selectAddress;
  final FullAddress? fullAddress;
  const AddressPickerWidget(
      {Key? key,
      this.isValidate,
      this.title,
      this.onTap,
      this.selectAddress,
      this.fullAddress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: fullAddress != null
          ? Container(
              height: fullAddress != null ? 100 : 60,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: isValidate != null && isValidate!
                          ? const Color(0xff6D7174)
                          : isValidate != null && !isValidate!
                              ? Colors.red
                              : const Color(0xff6D7174),
                      radius: const Radius.circular(10),
                      strokeWidth: 1,
                      // strokeCap: StrokeCap.round,
                      dashPattern: fullAddress != null ? [1] : [5],
                      strokeCap: fullAddress != null
                          ? StrokeCap.square
                          : StrokeCap.round,
                      child: Container(
                        height: fullAddress != null ? null : 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: fullAddress != null
                                ? Colors.white
                                : Colors.grey[100]),
                        width: double.infinity,
                        child: fullAddress == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/svgfile/addLocation.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Choose $title',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            fullAddress!.addressList!.length ==
                                                    3
                                                ? '${fullAddress?.streetNo} ${fullAddress?.houseNo}, ${fullAddress!.addressList![0].name}, ${fullAddress!.addressList![1].name}, ${fullAddress!.addressList![2].name}'
                                                : '${fullAddress?.streetNo} ${fullAddress?.houseNo}, ${fullAddress!.addressList![0].name}, ${fullAddress!.addressList![1].name}, ${fullAddress!.addressList![2].name}, ${fullAddress!.addressList![3].name}',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset(
                                        'assets/images/svgfile/editLocation.svg')
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  if (fullAddress != null)
                    Positioned(
                      top: 4,
                      left: 15,
                      child: Container(
                        color: Theme.of(context).cardColor,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ),
                    )
                ],
              ),
            )
          // : selectAddress == null
          //     ? Padding(
          //         padding: const EdgeInsets.only(left: 20, top: 10),
          //         child: Row(
          //           children: [
          //             SvgPicture.asset('assets/images/svgfile/addLocation.svg'),
          //             const SizedBox(width: 10),
          //             Text(
          //               'Choose $title',
          //               style: Theme.of(context).textTheme.headline3,
          //             ),
          //           ],
          //         ),
          //       )

          : selectAddress == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    color: Colors.transparent,
                    height: !isValidate! && isValidate != null ? null : 40,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                'assets/images/svgfile/addLocation.svg'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Choose $title',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (!isValidate! && isValidate != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Please choose an Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectAddress!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                              'assets/images/svgfile/editLocation.svg')
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text('$title'),
                            const Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

      // : Container(
      //     height: selectAddress != null ? 100 : 60,
      //     margin: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Stack(
      //       children: [
      //         Positioned(
      //           top: 10,
      //           left: 0,
      //           right: 0,
      //           bottom: 0,
      //           child: DottedBorder(
      //             borderType: BorderType.RRect,
      //             color: isValidate != null && isValidate!
      //                 ? const Color(0xff6D7174)
      //                 : isValidate != null && !isValidate!
      //                     ? Colors.red
      //                     : const Color(0xff6D7174),
      //             radius: const Radius.circular(10),
      //             child: Container(
      //               height: selectAddress != null ? null : 50,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                   color: selectAddress != null
      //                       ? Colors.white
      //                       : Colors.grey[100]),
      //               width: double.infinity,
      //               child: selectAddress == null
      //                   ? Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         SvgPicture.asset(
      //                             'assets/images/svgfile/addLocation.svg'),
      //                         const SizedBox(
      //                           width: 10,
      //                         ),
      //                         Text(
      //                           'Choose $title',
      //                           style: TextStyle(
      //                               color: Theme.of(context).primaryColor),
      //                         ),
      //                       ],
      //                     )
      //                   : Padding(
      //                       padding: const EdgeInsets.symmetric(
      //                           horizontal: 20, vertical: 10),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Expanded(
      //                             child: Column(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.start,
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   selectAddress!,
      //                                   style: const TextStyle(
      //                                       color: Colors.black),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           const SizedBox(width: 10),
      //                           SvgPicture.asset(
      //                               'assets/images/svgfile/editLocation.svg')
      //                         ],
      //                       ),
      //                     ),
      //             ),
      //             strokeWidth: 1,
      //             // strokeCap: StrokeCap.round,
      //             dashPattern:
      //                 selectAddress != null && isValidate! ? [1] : [5],
      //             strokeCap: selectAddress != null && isValidate!
      //                 ? StrokeCap.square
      //                 : StrokeCap.round,
      //           ),
      //         ),
      //         if (selectAddress != null)
      //           Positioned(
      //             top: 4,
      //             left: 15,
      //             child: Container(
      //               color: Theme.of(context).cardColor,
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: Text(
      //                 title!,
      //                 style: const TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 10,
      //                   fontWeight: FontWeight.w100,
      //                   fontFamily: 'DMSans',
      //                 ),
      //               ),
      //             ),
      //           )
      //       ],
      //     ),
      //   ),
    );
  }
}
