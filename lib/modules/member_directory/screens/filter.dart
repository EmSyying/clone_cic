import 'dart:convert';

import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/select_option_filter.dart';
import 'package:cicgreenloan/modules/member_directory/screens/filter_option.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/dirctory/filter_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../Utils/helper/firebase_analytics.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final _filterOption = Get.put(DocumentCategory());
  final _memberCon = Get.put(MemberController());
  List<Map<String, List<int>>> mapListFilter = [];

  Future<dynamic> loadDataFilter() async {
    await _filterOption.fetchFiltersOption();
  }

  int currentIndex = 0;

  SelectOptionFilter selectOptionFilter = SelectOptionFilter();

  List<MapData> mapData = [];

  @override
  void initState() {
    loadDataFilter();
    // _memberCon.memberList.clear();
    // _filterOption.filterMember();
    super.initState();
  }

  void onNavigator(int index) async {
    var result = await Navigator.push<SelectOptionFilter>(
        context,
        MaterialPageRoute(
            builder: (context) => FilterOption(
                index: index,
                //  selectOptionIndexList:_memberCon.mapList.entries['company',t] ,
                display: _filterOption.optionFormFilterList[index].display)));
    if (result != null) {
      mapData.clear();
      _memberCon.memberList.clear();
      setState(() {
        selectOptionFilter = result;
        mapData.add(selectOptionFilter.mapData!);
      });

      mapData.map((e) {
        _memberCon.mapList[json.encode(e.key)] = e.value!;
      }).toList();

      if (_memberCon.mapList.values.isEmpty) {
        debugPrint('Work');
        _memberCon.memberList.clear();
        _memberCon.memberResult.value = 0;
      } else {
        debugPrint('Work else');
        _memberCon.listMemberFiltered.clear();
        _memberCon.onFetchAllMember(
          page: 1,
          filterJson: _memberCon.mapList.toString(),
        );
        _memberCon.listMemberFiltered = _memberCon.listAllMember;
        //old code
        // _memberCon.fetchAllMembers(filterJson: _memberCon.mapList.toString());

      }

      // _memberCon.fetchAllMembers(
      //     filterJson: '${json.decode(maps.values.toString())}');
      // _memberCon.fetchAllMembers(filterJson: mapListFilter[0].toString());
      // selectOptionFilter.selectOptionFilter
      //     .map((e) => print('Select Filter For Member: ${e.display}'))
      //     .toList();

      // print(
      //     'OptionSelect Display: ${selectOptionFilter.selectOptionFilter[0].display}');
      // print('Select Index: ${selectOptionFilter.selectIndex![0]}');
    } else {
      setState(() {
        mapData.clear();

        if (_memberCon.mapList.values.isEmpty) {
          // print('hello-');
          // _filterOption.optionFormFilterList[_index].selectedNumber = null;
          setState(() {
            _memberCon.memberList.clear();
          });
        }
        // else
        //
      });
      if (_memberCon.isReset.value) {
        if (_memberCon.mapList.values.isEmpty) {
          setState(() {
            _memberCon.memberList.clear();
            _memberCon.memberResult.value = 0;
          });
        } else {
          _memberCon.fetchAllMembers(filterJson: _memberCon.mapList.toString());
          _memberCon.isReset.value = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
          context: context,
          title: 'Filters',
          leading: IconButton(
              icon: Icon(
                Icons.clear,
                color: Get.theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () {
                _memberCon.mapList.clear();
                _memberCon.memberResult.value = 0;
                _memberCon.memberList.clear();
                _memberCon.memberCurrentPage.value = 0;
                _memberCon.memberLastPage.value = 0;
                Navigator.pop(context, true);
              })),
      body: Obx(
        () => !_filterOption.isLoading.value
            ? RefreshIndicator(
                onRefresh: loadDataFilter,
                key: refreshKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _memberCon.memberCurrentPage.value = 0;
                        _memberCon.memberLastPage.value = 0;
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'Directory FIlter By Company');
                        onNavigator(0);
                      },
                      child: ListTile(
                        title: Text(
                          "${_filterOption.optionFormFilterList[0].display}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        trailing: SizedBox(
                          width: _filterOption
                                      .optionFormFilterList[0].selectedNumber !=
                                  null
                              ? 50.0
                              : 20,
                          child: Row(
                            children: [
                              _filterOption.optionFormFilterList[0]
                                          .selectedNumber !=
                                      null
                                  ? Container(
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFBDBDBD)),
                                      child: Center(
                                        child: Text(
                                          _filterOption.optionFormFilterList[0]
                                                      .selectedNumber !=
                                                  null
                                              ? _filterOption
                                                  .optionFormFilterList[0]
                                                  .selectedNumber
                                                  .toString()
                                              : "",
                                          style: const TextStyle(
                                              color: Color(0xFF616161)),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _memberCon.memberCurrentPage.value = 0;
                        _memberCon.memberLastPage.value = 0;
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'Directory FIlter By Position');
                        onNavigator(1);
                      },
                      child: ListTile(
                        title: Text(
                          "${_filterOption.optionFormFilterList[1].display}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        trailing: SizedBox(
                          width: _filterOption
                                      .optionFormFilterList[1].selectedNumber !=
                                  null
                              ? 50.0
                              : 20,
                          child: Row(
                            children: [
                              _filterOption.optionFormFilterList[1]
                                          .selectedNumber !=
                                      null
                                  ? Container(
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFBDBDBD)),
                                      child: Center(
                                        child: Text(
                                          _filterOption.optionFormFilterList[1]
                                                      .selectedNumber !=
                                                  null
                                              ? _filterOption
                                                  .optionFormFilterList[1]
                                                  .selectedNumber
                                                  .toString()
                                              : "",
                                          style: const TextStyle(
                                              color: Color(0xFF616161)),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )

                // ListView.separated(
                //     padding: EdgeInsets.symmetric(vertical: 10),
                //     itemBuilder: (context, index) {
                //       return
                //     },
                //     separatorBuilder: (context, index) {
                //       return Divider(
                //         thickness: 1,
                //       );
                //     },
                //     itemCount: _filterOption.optionFormFilterList.length),
                )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return const FilterShimmer();
                },
                itemCount: 15,
              ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(
                color: Colors.grey, width: 0.2, style: BorderStyle.solid),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Clear",
                  isOutline: true,
                  isDisable: false,
                  onPressed: () {
                    setState(() {
                      // _filterOption.optionFormFilterList[1].selectedNumber =
                      //     null;
                      // _filterOption.optionFormFilterList[0].selectedNumber =
                      //     null;
                      _memberCon.memberResult.value = 0;
                    });
                    _memberCon.memberCurrentPage.value = 0;
                    _memberCon.memberLastPage.value = 0;
                  },
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Obx(
                () => Container(
                  height: 50.0,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: 15.0, top: 20.0, bottom: 25.0),
                  child: _memberCon.isLoading.value == true &&
                          _memberCon.memberResult.value == 0
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.black.withOpacity(0.1),
                          ),
                          child: const SpinKitThreeBounce(
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      : _memberCon.isLoading.value == false &&
                              _memberCon.listMemberFiltered.isEmpty
                          ? CustomButton(
                              title: "Show Result",
                              isOutline: false,
                              isDisable: true,
                              onPressed: () {},
                            )
                          : CustomButton(
                              title:
                                  // "Show Result ${_memberCon.memberResult.value.toString()}",
                                  "Show Result ${_memberCon.listMemberFiltered.length}",
                              isOutline: false,
                              isDisable: false,
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                            ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
