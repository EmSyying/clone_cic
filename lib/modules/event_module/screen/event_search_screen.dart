import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_empty_state.dart';
import '../../../widgets/events/new_event.dart';
import '../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../member_directory/controllers/customer_controller.dart';
import '../controller/event_controller.dart';

class EventSearchScreen extends StatefulWidget {
  const EventSearchScreen({super.key});

  @override
  State<EventSearchScreen> createState() => _EventSearchScreenState();
}

class _EventSearchScreenState extends State<EventSearchScreen> {
  TextEditingController searchtextController = TextEditingController();
  final _eventController = Get.put(EventController());
  final _customerController = Get.put(CustomerController());
  String searchFilter = '';
  int index = 0;
  searchText(textSearch) async {
    setState(() {
      searchFilter = textSearch;
    });
    if (textSearch.isNotEmpty) {
      debugPrint('Text Search Filed');
      setState(() {
        searchFilter = textSearch;
      });
      index == 1
          ? _eventController.onSearchPastEvent(
              _customerController.customer.value.customerId!, searchFilter)
          : _eventController.onSearchUpComingEvent(
              _customerController.customer.value.customerId!, searchFilter);
    }
    if (textSearch.isEmpty) {
      index == 1
          ? _eventController
              .getPastEvent(_customerController.customer.value.customerId!)
          : () {
              _eventController.searchResultNewEvent.clear();
              _eventController
                  .getNewEvent(_customerController.customer.value.customerId!);
              _eventController.getFeatureEvent(
                  _customerController.customer.value.customerId!);
            }();
    }
  }

  Timer? searchOnStoppedTyping;
  _onChangeHandler(value) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => searchText(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: SizedBox(
          width: 22,
          height: 22,
          child: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        leadingWidth: 30,
        // titleSpacing: 0,
        title: Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomFormFieldSearch(
            onSaved: (e) {},
            onChanged: (v) {
              _onChangeHandler(v);
            },
            controller: searchtextController,
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: Obx(
        () => _eventController.isLoadingNew.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _eventController.searchResultNewEvent.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: NewEvent(
                        title: 'New Events',
                        newDataList: _eventController.newDataList),
                  )
                : const CustomEmptyState(
                    title: 'You can find something',
                    description: '',
                  ),
      ),
      // ConnectivityWidgetWrapper(
      //   stacked: false,
      //   alignment: Alignment.bottomCenter,
      //   offlineWidget: Column(
      //     children: const [
      //       Expanded(child: OfflineWidget()),
      //     ],
      //   ),
      // ),
    );
  }
}
