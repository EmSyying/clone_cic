import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:flutter/material.dart';

class DashboardTypeAM extends StatelessWidget {
  const DashboardTypeAM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
      context: context,
      title: 'Mobile',
    ));
  }
}
