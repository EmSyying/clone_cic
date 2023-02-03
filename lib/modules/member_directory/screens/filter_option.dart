import 'dart:io';
import 'dart:convert';

import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/filter_option.dart';
import 'package:cicgreenloan/modules/member_directory/models/select_option_filter.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/dirctory/filter_option.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar_colorswhite.dart';

class FilterOption extends StatefulWidget {
  final String? display;
  final int? index;
  final List<int>? selectOptionIndexList;

  const FilterOption(
      {Key? key, this.display, this.index, this.selectOptionIndexList})
      : super(key: key);

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final _filterOptionByType = Get.put(DocumentCategory());
  bool isSelect = false;
  String searchFilter = '';
  bool isLoadingMore = false;
  Map<String, List<int>> selectFilterMap = {};
  List<Map<String, List<int>>> selectFilterMapList = [];
  // Future optionListFuture;
  List<OptionFormFilter> optionList = [];
  SelectOptionFilter selectOptionFilter = SelectOptionFilter();

  List<int> selectIndexList = [];
  List<int> optionIdList = [];
  final _memberCon = Get.put(MemberController());
  @override
  void initState() {
    //  _filterOptionByType.fetchFilterOptionByType(widget.display);

    loadDataFilterOption();

    super.initState();
  }

  Future<dynamic> loadDataFilterOption() async {
    await _filterOptionByType.fetchFilterOptionByType(widget.display!);
    _memberCon.mapList.entries.map((e) {
      _filterOptionByType.filterByTypeList.asMap().entries.map((index) {
        if (e.value.contains(index.value.id)) {
          _filterOptionByType.filterByTypeList[index.key].isSelected = true;
          if (!optionIdList
              .contains(_filterOptionByType.filterByTypeList[index.key].id)) {
            optionIdList
                .add(_filterOptionByType.filterByTypeList[index.key].id!);
          }

          optionList.add(_filterOptionByType.filterByTypeList[index.key]);
        } else {}
      }).toList();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        title: '${widget.display}',
        leading: IconButton(
            icon: kIsWeb
                ? const Icon(Icons.arrow_back)
                : Platform.isAndroid
                    ? const Icon(Icons.arrow_back)
                    : const Icon(Icons.arrow_back_ios),
            color: Get.theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            onPressed: () {
              Navigator.pop(context, null);
            }),
        action: [
          GestureDetector(
            onTap: () {
              //reset list
              setState(() {
                optionList.clear();
                optionIdList.clear();
                // selectOptionFilter = null;
                _memberCon.isReset.value = true;
                _memberCon.memberList.clear();
                // _filterOptionByType
                //  _memberCon.mapList[json.encode(widget.display)].clear();
                _filterOptionByType.filterByTypeList.map((e) {
                  e.isSelected = false;
                }).toList();
                _memberCon.mapList.remove(json.encode(widget.display));
                _memberCon.memberResult.value = 0;
              });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "Reset",
                  style: TextStyle(
                      fontSize: 17,
                      color: optionList.isNotEmpty
                          ? Theme.of(context).primaryColor
                          : Colors.grey),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/svgfile/search.svg',
                    height: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (v) async {
                        _filterOptionByType.filterByTypeList.clear();
                        if (v.isNotEmpty) {
                          setState(() {
                            searchFilter = v;
                          });
                          await _filterOptionByType.searchDataByOption(
                              type: widget.display, search: v);
                          //select or not ?

                          optionList.map((e) {
                            _filterOptionByType.filterByTypeList
                                .asMap()
                                .entries
                                .map((index) {
                              if (e.display == index.value.display) {
                                _filterOptionByType
                                    .filterByTypeList[index.key] = e;
                              }

                              // if(  optionList.contains(e)){
                              //   _filterOptionByType
                              //       .filterByTypeList[index.key].isSelected=true;
                              //   print('idsss-1: ${index.value.display} : ${e.display} : ${index.value.isSelected} : ${e.isSelected}');
                              //   if(optionList.contains(e)){

                              //     print('id-: ${index.value.id}');
                              //     print('idsss-2: ${index.value.display} : ${index.value.id} : ${index.value.isSelected} : ${e.isSelected}');
                              //   }
                              //
                              //
                              // }
                            }).toList();
                          }).toList();
                        }
                        if (v.isEmpty) {
                          await _filterOptionByType
                              .fetchFilterOptionByType(widget.display!);
                          //select or not ?
                          optionList
                              .map((e) => _filterOptionByType.filterByTypeList
                                      .asMap()
                                      .entries
                                      .map((index) {
                                    if (e.display == index.value.display) {
                                      _filterOptionByType
                                          .filterByTypeList[index.key] = e;
                                    }
                                  }).toList())
                              .toList();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => _filterOptionByType.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: loadDataFilterOption,
                      key: refreshKey,
                      child: ListView.builder(
                          itemCount:
                              _filterOptionByType.filterByTypeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            OptionFormFilter optionFilter =
                                _filterOptionByType.filterByTypeList[index];
                            return GestureDetector(
                              onTap: () {
                                debugPrint(
                                    'ID = ${_filterOptionByType.filterByTypeList[index].id}');
                                setState(() {
                                  selectIndexList.add(index);
                                  _filterOptionByType
                                          .filterByTypeList[index].isSelected =
                                      !_filterOptionByType
                                          .filterByTypeList[index].isSelected!;
                                  if (_filterOptionByType
                                          .filterByTypeList[index].isSelected ==
                                      true) {
                                    if (!optionIdList.contains(
                                        _filterOptionByType
                                            .filterByTypeList[index].id)) {
                                      optionIdList.add(_filterOptionByType
                                          .filterByTypeList[index].id!);
                                    }
                                    optionList.add(optionFilter);
                                  } else {
                                    optionList.remove(_filterOptionByType
                                        .filterByTypeList[index]);
                                    optionIdList.remove(_filterOptionByType
                                        .filterByTypeList[index].id);
                                  }
                                });
                              },
                              child: FilterByType(
                                display: _filterOptionByType
                                    .filterByTypeList[index].display!,
                                isSelect: _filterOptionByType
                                    .filterByTypeList[index].isSelected!,
                              ),
                            );
                          }),
                    )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Cancel",
                  isOutline: true,
                  isDisable: false,
                  onPressed: () {
                    setState(() {
                      optionList.clear();
                      optionIdList.clear();
                      // selectOptionFilter = null;
                      _memberCon.isReset.value = true;
                      _memberCon.memberList.clear();
                      // _filterOptionByType.optionFormFilterList[widget.index]
                      //     .selectedNumber = null;
                      //  _memberCon.mapList[json.encode(widget.display)].clear();
                      _filterOptionByType.filterByTypeList.map((e) {
                        e.isSelected = false;
                      }).toList();
                      _memberCon.mapList.remove(json.encode(widget.display));
                      _memberCon.memberResult.value = 0;
                    });
                  },
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title:
                      "Selected ${optionList.isNotEmpty ? "(${optionList.length.toString()})" : ""}",
                  isOutline: false,
                  isDisable: false,
                  onPressed: optionList.isEmpty
                      ? () {}
                      : () {
                          selectFilterMap = {widget.display!: optionIdList};
                          _memberCon.memberResult.value = 0;
                          MapData mapData = MapData(
                              key: widget.display!, value: optionIdList);
                          selectOptionFilter = SelectOptionFilter(
                              selectOptionFilter: optionList,
                              selectIndex: selectIndexList,
                              mapFilterList: selectFilterMap,
                              filterTitle: widget.display!,
                              optionIdList: optionIdList,
                              mapData: mapData);

                          _filterOptionByType
                              .optionFormFilterList[widget.index!]
                              .selectedNumber = optionList.length;
                          _memberCon.isReset.value = false;
                          Navigator.pop(context, selectOptionFilter);
                        },
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
