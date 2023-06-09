import 'dart:async';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/event_module/screen/past_event.dart';
import 'package:cicgreenloan/modules/event_module/screen/up_coming.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_tab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

  final today = DateTime.now();
  int? currentSelected;
  int? currentYear;
  bool? isDisplayEventTap = true;
  int? yearIndex, monthIndex;
  void _checkDate() {
    _eventController.eventDate.value =
        FormatDate.investmentDateDropDown("$today");

    currentYear = today.year;

    _eventController.eventCalendarList.asMap().entries.map((y) {
      if (y.value.year == currentYear) {
        yearIndex = y.key;
        y.value.month?.asMap().entries.map((m) {
          monthIndex = m.key;
        }).toList();
      }
    }).toList();

    if (yearIndex != null && monthIndex != null) {}

    Future.delayed(const Duration(milliseconds: 700), () {
      Scrollable.ensureVisible(
        (_eventController.eventCalendarList[yearIndex!].month?[monthIndex!].key
            ?.currentContext)!,
        alignment: 0,
        duration: const Duration(milliseconds: 400),
      ).then((value) {
        Future.delayed(const Duration(milliseconds: 200), () {
          currentSelected = today.month - 1;
          setState(() {});
        });
      });
    });
  }

  @override
  void initState() {
    _eventController.onFetchEvetCalendar().then(
          (value) => _checkDate(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          isLeading: false,
        ),
        body:  Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.only(bottom: 25, right: 3),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          // physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: _eventController.eventCalendarList
                                .asMap()
                                .entries
                                .map(
                                  (year) => Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 19.0),
                                          child: Text(
                                            year.value.year.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color:
                                                        const Color(0xffffffff)
                                                            .withOpacity(0.6),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ),
                                        Row(
                                          children: year.value.month!
                                              .asMap()
                                              .entries
                                              .map(
                                                (month) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 19.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // Move to Page 0
                                                      if (_pageViewController
                                                              .page !=
                                                          0) {
                                                        _pageViewController
                                                            .jumpToPage(0);
                                                      }

                                                      ///When click on the same month twice not work
                                                      if (currentSelected !=
                                                              month.key ||
                                                          currentYear !=
                                                              year.value.year) {
                                                        setState(() {
                                                          currentSelected =
                                                              month.key;
                                                          currentYear =
                                                              year.value.year;

                                                          yearIndex = year.key;

                                                          if (year.value.year ==
                                                                  today.year &&
                                                              month.value
                                                                      .name ==
                                                                  FormatDate
                                                                      .displayMonthOnly(
                                                                          '${DateTime.now()}')) {
                                                            isDisplayEventTap =
                                                                true;
                                                            // if user select current month
                                                            _eventController
                                                                    .eventDate
                                                                    .value =
                                                                FormatDate
                                                                    .investmentDateDropDown(
                                                                        "${DateTime.now()}");
                                                          } else {
                                                            // if user select last month
                                                            isDisplayEventTap =
                                                                false;
                                                            _eventController
                                                                    .eventDate
                                                                    .value =
                                                                month.value
                                                                    .date!;
                                                          }
                                                          debugPrint(
                                                              "isDisplayEventTap:$isDisplayEventTap");
                                                        });

                                                        debugPrint(
                                                            "is Pressed on event date");

                                                        _eventController
                                                            .onRefreshUpCommingEvent(
                                                                enableDate:
                                                                    true);
                                                      }

                                                      debugPrint(
                                                          'DateEvent : ${_eventController.eventDate.value}');
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          month.value.name
                                                              .toString(),
                                                          key: month.value.key =
                                                              GlobalKey(),
                                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                              color: currentSelected ==
                                                                          month
                                                                              .key &&
                                                                      year.value
                                                                              .year ==
                                                                          currentYear
                                                                  ? Colors.white
                                                                  : const Color(
                                                                          0xffffffff)
                                                                      .withOpacity(
                                                                          0.6),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  currentSelected ==
                                                                          month
                                                                              .key
                                                                      ? FontWeight
                                                                          .w500
                                                                      : FontWeight
                                                                          .w400),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      // const SizedBox(width: 50),
                      IconButton(
                        color: Colors.white,
                        onPressed: () {
                          // Move to Page 0
                          if (_pageViewController.page != 0) {
                            _pageViewController.jumpToPage(0);
                          }
                          if (currentSelected != null && currentYear != null) {
                            ///Month Index Handler
                            if (_eventController.eventCalendarList[yearIndex!]
                                        .month!.length -
                                    1 ==
                                currentSelected) {
                              debugPrint('Work on SUM 1');
                              currentSelected = 0;

                              ///Year Index Handler
                              if (yearIndex! <
                                  _eventController.eventCalendarList.length -
                                      1) {
                                debugPrint('Work on SUM 2');
                                yearIndex = yearIndex! + 1;
                              } else {
                                debugPrint('Work on SUM 3');
                                yearIndex = 0;
                              }
                            } else {
                              currentSelected = currentSelected! + 1;
                            }
                          }

                          currentYear = _eventController
                              .eventCalendarList[yearIndex!].year;
                          setState(() {});

                          Scrollable.ensureVisible(
                            _eventController.eventCalendarList[yearIndex!]
                                .month![currentSelected!].key!.currentContext!,
                            alignment: 0.5,
                            duration: const Duration(milliseconds: 500),
                          );

                          if (currentYear == today.year &&
                              currentSelected! + 1 == today.month) {
                            isDisplayEventTap = true;
                          } else {
                            isDisplayEventTap = false;
                          }

                          _eventController.eventDate.value = _eventController
                                  .eventCalendarList[yearIndex!]
                                  .month![currentSelected!]
                                  .date ??
                              '';

                          _eventController.onRefreshUpCommingEvent(
                              enableDate: true);
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
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
                      if (isDisplayEventTap == true)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0),
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
                                      duration:
                                          const Duration(microseconds: 200),
                                      curve: Curves.fastOutSlowIn);
                                  if (segmentedControlValue == 1) {
                                    _eventController.getPastEvent(
                                        _customerController
                                            .customer.value.customerId!);
                                  }
                                });
                              }),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: PageView(
                          physics: isDisplayEventTap == true
                              ? const ScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
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
                            setState(() {
                              if (value == 1) {
                                _eventController.getPastEvent(
                                    _customerController
                                        .customer.value.customerId!);
                              }
                            });
                          },
                          children: transactionPage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// class DynamicEvent extends StatefulWidget {
//   const DynamicEvent({Key? key}) : super(key: key);

//   @override
//   State<DynamicEvent> createState() => _DynamicEventState();
// }

// class _DynamicEventState extends State<DynamicEvent> {
//   // CalendarController _controller;
//   Map<DateTime, List<dynamic>>? events;
//   List<dynamic>? _selectedEvents;
//   TextEditingController? _eventController;
//   SharedPreferences? prefs;
//   DateTime firstDay = DateTime.now();
//   DateTime _focusDay = DateTime.now();
//   CalendarFormat? calenderFormat;

//   // late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime? _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? rangeStart;
//   DateTime? rangeEnd;

//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         rangeStart = null; // Important to clean those
//         rangeEnd = null;
//         rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//     }
//   }

//   void onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       rangeStart = start;
//       rangeEnd = end;
//       rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });

//     // `start` or `end` could be null
//   }

//   @override
//   void initState() {
//     super.initState();
//     // _controller = CalendarController();
//     _selectedDay = _focusedDay;
//     _eventController = TextEditingController();
//     events = {};
//     _selectedEvents = [];
// //    prefsData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               color: Theme.of(context).primaryColor,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//               child: Column(
//                 children: [
//                   TableCalendar(
//                     headerVisible: true,
//                     daysOfWeekStyle: const DaysOfWeekStyle(
//                       weekdayStyle: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14),
//                       weekendStyle: TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14),
//                     ),
//                     selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                     formatAnimationCurve: Curves.ease,
//                     focusedDay: _focusDay,
//                     onPageChanged: (day) {
//                       _focusDay = day;
//                     },
//                     calendarFormat: CalendarFormat.week,
//                     startingDayOfWeek: StartingDayOfWeek.monday,
//                     onFormatChanged: (CalendarFormat format) {
//                       if (_calendarFormat != format) {
//                         setState(() {
//                           _calendarFormat = format;
//                         });
//                       }
//                     },
//                     onDaySelected: (selectedDay, focusedDay) {
//                       setState(() {
//                         _selectedDay = selectedDay;
//                         _focusDay =
//                             focusedDay; // update `_focusedDay` here as well
//                       });
//                     },
//                     firstDay: DateTime.now(),
//                     lastDay: DateTime(2050, 02, 20),
//                     calendarStyle: const CalendarStyle(
//                       markerMargin: EdgeInsets.all(20),
//                       holidayDecoration: BoxDecoration(
//                           color: Colors.red, shape: BoxShape.circle),
//                       canMarkersOverflow: true,
//                       defaultTextStyle: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       holidayTextStyle: TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       isTodayHighlighted: true,
//                       disabledTextStyle: TextStyle(
//                           color: Colors.white54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       markerDecoration: BoxDecoration(
//                           color: Colors.blue, shape: BoxShape.circle),
//                       outsideTextStyle: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       weekendTextStyle: TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       todayDecoration: BoxDecoration(
//                         color: Color(0xFFFF0000),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     headerStyle: HeaderStyle(
//                       titleTextStyle: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                       decoration: const BoxDecoration(shape: BoxShape.circle),
//                       leftChevronIcon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                       rightChevronIcon: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.white,
//                       ),
//                       formatbuttonTextStyle:
//                           const TextStyle(color: Colors.white),
//                       formatbuttonDecoration: BoxDecoration(
//                         border: Border.all(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ..._selectedEvents!.map((event) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 20,
//                   width: MediaQuery.of(context).size.width / 2,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.red,
//                       border: Border.all(color: Colors.grey)),
//                   child: Center(
//                       child: Text(
//                     event,
//                     style: const TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16),
//                   )),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }

//   showAddDialog() async {
//     await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               backgroundColor: Colors.white70,
//               title: const Text("Add Events"),
//               content: TextField(
//                 controller: _eventController,
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(
//                         color: Colors.red, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: () {
//                     if (_eventController!.text.isEmpty) return;
//                     setState(() {
//                       _eventController!.clear();
//                       Navigator.pop(context);
//                     });
//                   },
//                 )
//               ],
//             ));
//   }
// }

class MonthAndYear {
  String month;
  GlobalKey? key;
  MonthAndYear({required this.month, this.key});
}
