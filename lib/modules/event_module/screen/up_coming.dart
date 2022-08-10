import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/widgets/events/event_shimmer.dart';
import 'package:cicgreenloan/widgets/events/feature_event.dart';
import 'package:cicgreenloan/widgets/events/feature_event_shimmer.dart';
import 'package:cicgreenloan/widgets/events/new_event.dart';
import 'package:cicgreenloan/widgets/member_directory/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class UpComing extends StatefulWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  final _eventController = Get.put(EventController());
  final _customerController = Get.put(CustomerController());

  @override
  void initState() {
    _eventController
        .getNewEvent(_customerController.customer.value.customerId!);
    _eventController.getFeatureEvent(
      _customerController.customer.value.customerId!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            !_eventController.isLoadingFeture.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _eventController.featureDataList.isEmpty &&
                              _eventController.isLoadingFeture.value == false
                          ? Container()
                          : FeatureEvent(
                              title: 'Featured Events',
                              featureDataList:
                                  _eventController.featureDataList),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[100]!,
                        highlightColor: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const FeatureShimmer(),
                      const EventShimmerCard(),
                    ],
                  ),
            !_eventController.isLoadingNew.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _eventController.newDataList.isEmpty &&
                              _eventController.isLoadingNew.value == false
                          ? const EmptyStateProfile(
                              isEditable: false,
                              title: 'No Events Yet',
                              caption: '',
                              iconUrl: 'assets/images/emptyState.png',
                            )
                          : NewEvent(
                              title: 'New Events',
                              newDataList: _eventController.newDataList),
                      const SizedBox(height: 20.0),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const FeatureShimmer(),
                      const EventShimmerCard(),
                    ],
                  ),
          ]),
    );
  }
}
