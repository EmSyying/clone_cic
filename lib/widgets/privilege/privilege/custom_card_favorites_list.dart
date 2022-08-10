import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/controller/privilege_controller.dart';
import 'custom_all_store_list.dart';

class CustomCardFavoriesList extends StatelessWidget {
  const CustomCardFavoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preController = Get.put(PrivilegeController());
    return CustomAllStoreList(
      storeList: preController.favoritesList,
    );
  }
}
