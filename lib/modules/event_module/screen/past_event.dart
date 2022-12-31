import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/widgets/events/event_shimmer.dart';
import 'package:cicgreenloan/widgets/events/new_event.dart';
import 'package:cicgreenloan/widgets/member_directory/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PastEvent extends StatefulWidget {
  const PastEvent({Key? key}) : super(key: key);

  @override
  State<PastEvent> createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  final _eventController = Get.put(EventController());
  final _customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !_eventController.isLoadingPast.value == true
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _eventController.pastDataList.isEmpty &&
                            _eventController.isLoadingPast.value == false
                        ? const EmptyStateProfile(
                            isEditable: false,
                            title: 'No Events Yet',
                            caption: '',
                            iconUrl: 'assets/images/emptyState.png',
                          )
                        : NewEvent(
                            title: 'Past Events',
                            newDataList: _eventController.pastDataList),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
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
                  const EventShimmerCard(),
                ],
              ),
            ),
    );
  }
}
