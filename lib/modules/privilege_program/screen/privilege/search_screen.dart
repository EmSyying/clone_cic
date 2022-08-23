import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/privilege/privilege/custom_all_store_list.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege/custom_location card.dart';
import '../../controller/privilege_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int segmentedControlValue = 0;
  PageController controller = PageController();
  final preCont = Get.put(PrivilegeController());

  onfilter(String? filter) {
    final filterShopList = preCont.shopModelList.where((shops) {
      final shopTitle = shops.shopNameInEnglish!.toLowerCase();
      return shopTitle.contains(filter!.toLowerCase());
    }).toList();
    setState(() {
      preCont.shopModelList.value = filterShopList;
    });
    debugPrint('heloo123456===++++:$filter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            //context.router.pop();
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 38,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomFormFieldSearch(
            onSaved: (e) {},
            onChanged: (v) {
              if (v == '') {
                preCont.shopModelList.value = [];
              } else {
                onfilter(v);
              }
              debugPrint('hiii123++++z:$v');
            },
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            color: Colors.transparent,
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlValue,
              backgroundColor: const Color(0xff252552).withOpacity(0.1),
              children: <int, Widget>{
                0: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Stores',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              },
              onValueChanged: (int? value) {
                setState(() {
                  segmentedControlValue = value!;
                  controller.animateToPage(segmentedControlValue,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn);
                });
              },
            ),
          ),
          SizedBox(
            height: 520,
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                segmentedControlValue = value;
                setState(() {});
              },
              children: [
                //===All Stores=============
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomAllStoreList(
                    shopList: preCont.shopModelList,
                  ),
                ),
                //Favoritess====12==============
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: preCont.listAllStores
                        .map(
                          (location) => CustomLocationCard(
                            locatModel: location,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
