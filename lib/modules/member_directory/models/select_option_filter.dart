import 'package:cicgreenloan/modules/member_directory/models/filter_option.dart';

class SelectOptionFilter {
  List<OptionFormFilter>? selectOptionFilter;
  List<int>? selectIndex;
  List<int>? optionIdList;
  Map<String, List<int>>? mapFilterList = {};
  String? filterTitle;
  MapData? mapData;

  SelectOptionFilter(
      {this.selectOptionFilter,
      this.selectIndex,
      this.mapFilterList,
      this.filterTitle,
      this.optionIdList,
      this.mapData});
}

class MapData {
  String? key;
  List<int>? value;

  MapData({this.key, this.value});
}
