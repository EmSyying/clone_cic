import 'dart:async';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/event_module/screen/past_event.dart';
import 'package:cicgreenloan/modules/event_module/screen/up_coming.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_tab.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/firebase_analytics.dart';

class EventScreen extends StatefulWidget {
  final bool? isNavigator;

  const EventScreen({Key? key, this.isNavigator}) : super(key: key);
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isSelectUpComing = true;
  bool isSelectPastEvent = false;
  bool isHidebtn = false;
  int segmentedControlValue = 0;
  final _eventController = Get.put(EventController());
  final _customerController = Get.put(CustomerController());
  final PageController _pageViewController = PageController();

  String? eventLabel;
  int index = 0;
  List<Widget> transactionPage = [const UpComing(), const PastEvent()];
  List<Widget> list = [const Text('hello1'), const Text('hello2')];

  List<CustomTab> tabs = [
    const CustomTab(
      title: 'Up Coming',
      isSelect: true,
      selectIndex: 0,
    ),
    const CustomTab(
      title: 'Past Event',
      isSelect: false,
      selectIndex: 1,
    ),
  ];

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

  String searchFilter = '';
  searchText(textSearch) async {
    setState(() {
      searchFilter = textSearch;
    });
    if (textSearch.isNotEmpty) {
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
              _eventController
                  .getNewEvent(_customerController.customer.value.customerId!);
              _eventController.getFeatureEvent(
                  _customerController.customer.value.customerId!);
            }();
    }
  }

  onFetchMoreData() {
    _eventController.page.value++;
    if (_eventController.isNext != null) {
      _eventController
          .getPastEvent(_customerController.customer.value.customerId!);
    }
  }

  // Ticket Caputure to gallery

  Event buildEvent({Recurrence? recurrence}) {
    return Event(
      title: 'Test eventeee',
      description: 'example',
      location: 'Flutter app',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(minutes: 30)),
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: const AndroidParams(
        emailInvites: ["test@example.com"],
      ),
      recurrence: recurrence,
    );
  }

  TextEditingController searchtextController = TextEditingController();

  int monthsID = 1;
  int selectedInd = 0;

  final months = [
    ['Jan', 'Feb', 'March', 'April'],
    ['May', 'June', 'July', 'Aug'],
    ['Sep', 'Oct', 'Nov', 'Dec']
  ];
  @override
  Widget build(BuildContext context) {
    // debugPrint('Recieved : ${widgt}');
    return CupertinoScaffold(
        body: Builder(
      builder: (BuildContext context) => CupertinoPageScaffold(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          isLogo: false,
          title: 'Event',
          elevation: 0,
          context: context,
          isLeading: true,
        ),
        body: ConnectivityWidgetWrapper(
          stacked: false,
          alignment: Alignment.bottomCenter,
          offlineWidget: Column(
            children: const [
              Expanded(child: OfflineWidget()),
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  color: AppColor.mainColor,
                ),
                padding: const EdgeInsets.only(bottom: 25, left: 10, right: 3),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: months[monthsID]
                            .asMap()
                            .entries
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedInd = e.key;
                                  });
                                },
                                child: Text(
                                  e.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color: selectedInd == e.key
                                              ? Colors.white
                                              : const Color(0xffffffff)
                                                  .withOpacity(0.6),
                                          fontSize: 20,
                                          fontWeight: selectedInd == e.key
                                              ? FontWeight.w500
                                              : FontWeight.w400),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          selectedInd = 0;
                          if (monthsID < months.length - 1) {
                            monthsID += 1;
                          } else {
                            monthsID = 0;
                          }
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
              // const DynamicEvent(),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {
                      onFetchMoreData();
                    } else {}
                    return false;
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
                        child: CupertinoSlidingSegmentedControl(
                            groupValue: segmentedControlValue,
                            backgroundColor:
                                const Color(0xff252552).withOpacity(0.1),
                            children: const <int, Widget>{
                              0: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Up Coming'),
                              ),
                              1: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Past Events'),
                              ),
                            },
                            onValueChanged: (int? e) {
                              setState(() {
                                segmentedControlValue = e!;
                                _pageViewController.animateToPage(
                                    segmentedControlValue,
                                    duration: const Duration(microseconds: 200),
                                    curve: Curves.fastOutSlowIn);
                              });
                            }),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           _eventController.eventTapName.value =
                        //               'Up Coming';
                        //           if (isSelectPastEvent == true) {
                        //             setState(() {
                        //               isSelectUpComing = true;
                        //               isSelectPastEvent = false;
                        //               index = 0;
                        //               eventLabel = "Up Coming";
                        //               searchtextController.text = '';
                        //             });
                        //           } else {
                        //             setState(() {
                        //               isSelectUpComing = false;
                        //               isSelectPastEvent = true;
                        //               index = 0;
                        //               eventLabel = "Up Coming";
                        //               searchtextController.text = '';
                        //             });
                        //           }
                        //         },
                        //         child: Container(
                        //           decoration: isSelectUpComing
                        //               ? BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //                   color: Theme.of(context)
                        //                       .primaryColor
                        //                       .withAlpha(40),
                        //                 )
                        //               : BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //                   color: Theme.of(context).cardColor),
                        //           padding: const EdgeInsets.symmetric(
                        //               vertical: 10),
                        //           child: Center(
                        //             child: Text(
                        //               'Up Coming',
                        //               style: isSelectUpComing
                        //                   ? TextStyle(
                        //                       color: Theme.of(context)
                        //                           .primaryColor)
                        //                   : const TextStyle(),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 10.0),
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           _eventController.eventTapName.value =
                        //               'Past Event';
                        //           setState(() {
                        //             isSelectUpComing = false;
                        //             isSelectPastEvent = true;
                        //             index = 1;
                        //             eventLabel = "Past Event";
                        //             searchtextController.text = '';
                        //           });
                        //         },
                        //         child: Container(
                        //           decoration: isSelectPastEvent
                        //               ? BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //                   color: Theme.of(context)
                        //                       .primaryColor
                        //                       .withAlpha(40),
                        //                 )
                        //               : BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10),
                        //                   color: Theme.of(context).cardColor),
                        //           padding: const EdgeInsets.symmetric(
                        //               vertical: 10),
                        //           child: Center(
                        //             child: Text(
                        //               'Past Event',
                        //               style: isSelectPastEvent
                        //                   ? TextStyle(
                        //                       color: Theme.of(context)
                        //                           .primaryColor)
                        //                   : const TextStyle(),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 60, top: 20.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              //              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 13.0,
                                  left: 10.0,
                                  child: SvgPicture.asset(
                                    'assets/images/svgfile/search.svg',
                                    height: 20,
                                  ),
                                ),
                                TextFormField(
                                  controller: searchtextController,
                                  onChanged: (v) {
                                    _onChangeHandler(v);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      contentPadding:
                                          const EdgeInsets.only(left: 40)),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: 15,
                            child: SizedBox(
                              height: 50.0,
                              child: SvgPicture.asset(
                                'assets/images/svgfile/eventFilter.svg',
                                height: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //       left: 15.0, right: 15.0, top: 15.0),
                      //   child: index == 0 ? UpComing() : PastEvent(),
                      // ),
                      Expanded(
                        child: PageView(
                          controller: _pageViewController,
                          onPageChanged: (value) {
                            if (_pageViewController.page == 0) {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  'up coming');
                            } else {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  'past events');
                            }

                            segmentedControlValue = value;
                            setState(() {});
                          },
                          children: transactionPage,
                        ),
                      ),
                      // Container(
                      //     margin: const EdgeInsets.only(
                      //         left: 15.0, right: 15.0, top: 15.0),
                      //     child: list.elementAt(index)
                      //     // transactionPage.elementAt(index),
                      //     ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}

class DynamicEvent extends StatefulWidget {
  const DynamicEvent({Key? key}) : super(key: key);

  @override
  State<DynamicEvent> createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  // CalendarController _controller;
  Map<DateTime, List<dynamic>>? events;
  List<dynamic>? _selectedEvents;
  TextEditingController? _eventController;
  SharedPreferences? prefs;
  DateTime firstDay = DateTime.now();
  DateTime _focusDay = DateTime.now();
  CalendarFormat? calenderFormat;

  // late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime? _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        rangeStart = null; // Important to clean those
        rangeEnd = null;
        rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      rangeStart = start;
      rangeEnd = end;
      rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
  }

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
    _selectedDay = _focusedDay;
    _eventController = TextEditingController();
    events = {};
    _selectedEvents = [];
//    prefsData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColor.mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  TableCalendar(
                    headerVisible: true,
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      weekendStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    formatAnimationCurve: Curves.ease,
                    focusedDay: _focusDay,
                    onPageChanged: (day) {
                      _focusDay = day;
                    },
                    calendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onFormatChanged: (CalendarFormat format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2050, 02, 20),
                    calendarStyle: const CalendarStyle(
                      markerMargin: EdgeInsets.all(20),
                      holidayDecoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      canMarkersOverflow: true,
                      defaultTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      holidayTextStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      isTodayHighlighted: true,
                      disabledTextStyle: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      markerDecoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      outsideTextStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      weekendTextStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFFFF0000),
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      leftChevronIcon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      formatButtonTextStyle:
                          const TextStyle(color: Colors.white),
                      formatButtonDecoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ..._selectedEvents!.map((event) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    event,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              )),
        ],
      ),
    );
  }

  showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white70,
              title: const Text("Add Events"),
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_eventController!.text.isEmpty) return;
                    setState(() {
                      _eventController!.clear();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ));
  }
}
