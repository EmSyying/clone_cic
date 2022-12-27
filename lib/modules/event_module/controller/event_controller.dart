import 'dart:async';
import 'dart:convert';
import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/Utils/helper/custom_route_snackbar.dart';
import 'package:cicgreenloan/modules/event_module/screen/event_check_in_ticket.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/notify_share_pop_up.dart';
import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/google_map_module/controllers/google_map_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
import 'package:cicgreenloan/modules/event_module/models/event_ticket.dart';
import 'package:cicgreenloan/modules/event_module/models/registered_member.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/option_controller/option_controller.dart';
import '../../../configs/firebase_deeplink/deeplink_service.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../../utils/helper/color.dart';
import '../../../widgets/events/custom_register_form.dart';
import '../models/card_guests_model.dart';
import '../models/event_calendar.dart';
import '../models/get_register_model/get_register_model.dart';
import '../models/guest_model/guest_model.dart';
import '../models/select_checkin/select_checkin_model.dart';

class EventController extends GetxController {
  String? tokenKey;
  dynamic isNext;
  final page = 1.obs;
  final isloading = false.obs;
  final isLoadingNew = false.obs;
  final isLoadingPast = false.obs;
  final isLoadingMorePast = false.obs;
  final isLoadingFeture = false.obs;
  final isLoadingregisteredMember = false.obs;
  final featureEvent = EventData().obs;
  final featureDataList = <EventData>[].obs;
  final newEvent = EventData().obs;
  final newDataList = <EventData>[].obs;
  final pastEvent = EventData().obs;
  final pastDataList = <EventData>[].obs;
  final registermemberList = <RegistrationEventData>[].obs;
  // final registeredmember = RegistrationEventData().obs;
  final eventTicket = EventTicket().obs;
  final eventDetail = EventData().obs;
  final scrollTop = false.obs;
  final fullName = ''.obs;
  final positionMember = ''.obs;
  final companyNameMember = ''.obs;
  final phoneNumberMember = ''.obs;
  final isGenerateLink = false.obs;
  // final eventShortenUrl = ''.obs;
  final emailMember = ''.obs;
  final isLoadingTicket = false.obs;
  final customerController = Get.put(CustomerController());
  final googleMapCon = Get.put(GoogleMapsController());
  final List invitedMemberList = [];
  final memberList = <Member>[].obs;
  int eventId = 0;
  final isLoadingEventDetail = false.obs;
  final isRegister = false.obs;
  final eventTapName = 'Up Coming'.obs;
  final isAfterRegister = false.obs;
  final isAfterUnInterest = false.obs;
  final isAfterInterest = false.obs;

  onRefresh(int eventID) {
    fetchAllRegisteredMemeber("$eventID");
  }

  final listChecked = <CardGuestsModel>[].obs;

  onCheckSelected() {
    final guestCheck = cardGuestsList.where((v) => v.isCheckBox);
    listChecked.value = List.from(guestCheck);
  }

  final cardGuestsList = <CardGuestsModel>[
    CardGuestsModel(
      guest: 'Guest 1',
      nameGuest: 'Kim Oan',
      who: 'Daughter',
      // isCheckBox: true,
    ),
    CardGuestsModel(
      guest: 'Guest 2',
      nameGuest: 'Kim Oan',
      who: 'Daughter',
    ),
    CardGuestsModel(
      guest: 'Guest 3',
      nameGuest: 'Hany Sreng',
      who: 'Daughter',
      // isCheckBox: true,
    ),
    CardGuestsModel(
      guest: 'Guest 4',
      nameGuest: 'Srey Ying',
      who: 'Daughter',
    ),
    CardGuestsModel(
      guest: 'Guest 5',
      nameGuest: 'Virak',
      who: 'Daughter',
      // isCheckBox: true,
    ),
  ].obs;

  // Event Calendar
  final isEventCalendar = false.obs;
  final eventCalendarList = <EventCalendar>[].obs;
  Future<List<EventCalendar>> onFetchEvetCalendar() async {
    debugPrint("is event calendar workig1");
    isEventCalendar(true);
    await apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get, isAuthorize: true, url: 'event/calendar')
        .then((response) {
      var responseJson = response['data'];
      debugPrint("Event Calendar:$responseJson");
      eventCalendarList.clear();
      responseJson.map((e) {
        eventCalendarList.add(
          EventCalendar.fromJson(e),
        );
      }).toList();
      debugPrint("event calend list:${eventCalendarList.length}");
      isEventCalendar(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("is event calendar workig2${error.bodyString}");
      isEventCalendar(false);
    });

    return eventCalendarList;
  }

  Future<List<EventData>> getPastEvent(int? memberId) async {
    isLoadingPast(true);
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event?member_id=$memberId&posted=past&event_date=${eventDate.value}';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];
          pastDataList.clear();
          responseJson.map((e) {
            pastEvent.value = EventData.fromJson(e);
            pastDataList.add(pastEvent.value);
          }).toList();
        }
      });
    } catch (e) {
      debugPrint("getPastEvent Error : $e");
    } finally {
      isLoadingPast(false);
    }
    return pastDataList;
  }

  onRefreshUpCommingEvent() async {
    getNewEvent(customerController.customer.value.customerId!);
    getFeatureEvent(customerController.customer.value.customerId!);
  }

  onRefreshPassEvent() async {
    getPastEvent(customerController.customer.value.customerId!);
  }

  final eventDate = ''.obs;

  Future<List<EventData>> getNewEvent(int memberId) async {
    // debugPrint("is working new event");
    isLoadingNew(true);

    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event?posted=upcoming&type=new&event_date=${eventDate.value}';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          debugPrint("Current Month Year:$eventDate");
          var responseJson = json.decode(response.body)["data"];
          newDataList.clear();
          responseJson.map((e) {
            newDataList.add(EventData.fromJson(e));
          }).toList();

          // }
        }
      });
    } finally {
      isLoadingNew(false);
    }
    return newDataList;
  }

  Future<List<EventData>> onSearchPastEvent(int memberId, String search) async {
    isLoadingPast(true);
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event?posted=past&search=$search&event_date=${eventDate.value}';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];
          pastDataList.clear();
          responseJson.map((e) {
            pastEvent.value = EventData.fromJson(e);
            pastDataList.add(pastEvent.value);
          }).toList();
        }
      });
    } finally {
      isLoadingPast(false);
    }
    return pastDataList;
  }

  final searchResultNewEvent = <EventData>[].obs;
  Future<List<EventData>> onSearchUpComingEvent(
      int memberId, String search) async {
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event?posted=upcoming&search=$search&event_date=${eventDate.value}';
    isLoadingFeture(true);
    isLoadingNew(true);

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          featureDataList.clear();
          newDataList.clear();
          searchResultNewEvent.clear();
          responseJson.map((e) {
            newEvent.value = EventData.fromJson(e);
            newDataList.add(newEvent.value);
            searchResultNewEvent.add(newEvent.value);
          }).toList();
          // featureDataList.clear();
          // if (!featureDataList.contains(featureEvent.value)) {
          //   featureDataList.add(featureEvent.value);
          // }
          // newDataList.clear();
          // if (!newDataList.contains(newEvent.value)) {
          //   newDataList.add(newEvent.value);
          // }
        }
      });
    } finally {
      isLoadingFeture(false);
      isLoadingNew(false);
    }
    return newDataList;
  }

  Future<List<EventData>> getFeatureEvent(int memberId) async {
    isLoadingFeture(true);
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event?posted=upcoming&type=featured&event_date=${eventDate.value}';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          featureDataList.clear();
          responseJson['data'].map((e) {
            featureEvent.value = EventData.fromJson(e);
            featureDataList.add(featureEvent.value);
          }).toList();
        }
      });
    } finally {
      isLoadingFeture(false);
    }
    return featureDataList;
  }

  Future<List<RegistrationEventData>> fetchAllRegisteredMemeber(
      String eventId) async {
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event-registration?event_id=$eventId';

    isLoadingregisteredMember.value = true;
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];
          registermemberList.clear();
          responseJson.map((e) {
            registermemberList.add(RegistrationEventData.fromJson(e));
          }).toList();
        }
      });
    } catch (e) {
      debugPrint("fetchAllRegisteredMemeber Error : $e");
    } finally {
      isLoadingregisteredMember.value = false;
    }
    return registermemberList;
  }

  Future<void> onRegisterEvents({
    required BuildContext context,
    required int eventID,
  }) async {
    tokenKey = await LocalData.getCurrentUser();

    String url = '${FlavorConfig.instance.values!.apiBaseUrlV3}registration';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey',
      }, body: {
        // "invite_id": [1, 3],
        "event_id": "$eventID",
        "member_id": customerController.customer.value.customerId.toString(),
        "name": customerController.customer.value.fullName,
        "company_name": customerController.customer.value.company,
        "position": customerController.customer.value.position!.display!,
        "phone_number": customerController.customer.value.phone,
        "email": customerController.customer.value.email
      }).then((response) {
        if (response.statusCode == 200) {
          customRouterSnackbar(
            title: "Registered Event",
            description: "Your register has been submited successfully",
            type: SnackType.done,
          );

          isAfterRegister(true);
          onRefresh(eventID);
          fetchEventDetail(eventID);
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context, true);
          });
          update();
        } else {
          isAfterRegister(false);
        }
      });
    } catch (e) {
      debugPrint("$e");
    } finally {}
  }

  Future<void> onInterested(
      {required BuildContext context, int? eventid}) async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event/interested/$eventid';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }, body: {}).then((response) {
        if (response.statusCode == 200) {
          update();
          if (eventTapName.value == 'Up Coming') {
            onRefreshUpCommingEvent();
          } else {
            onRefreshPassEvent();
          }
        } else {}
      });
    } finally {}
  }

  Future<void> onUninterested(
      {required BuildContext context, int? eventid}) async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event/uninterested/$eventid';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }, body: {}).then((response) {
        if (response.statusCode == 200) {
          update();
          if (eventTapName.value == 'Up Coming') {
            onRefreshUpCommingEvent();
          } else {
            onRefreshPassEvent();
          }
        } else {}
      });
    } finally {}
  }

  Future<void> onGoing({required BuildContext context, int? eventid}) async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}event/interested/$eventid';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }, body: {}).then((response) {
        if (response.statusCode == 200) {
          // customRouterSnackbar(
          //   description: "Your Going has been submited successfully",
          //   title: ""
          // );
          // customSnackbar(
          //     context: context,
          //     color: Colors.green,
          //     imgUrl: 'assets/images/svgfile/successIcon.svg',
          //     label: "Your Going has been submited successfully",
          //     titleText: "Registration",
          //     messageText: "Your Going has been submited successfully");

          update();
        } else {}
      });
    } finally {}
  }

  Future<EventTicket> onFetchEventTicket(int eventId) async {
    isLoadingTicket(true);

    tokenKey = await LocalData.getCurrentUser();

    String url = '${FlavorConfig.instance.values!.apiBaseUrlV3}event/check-in';
    debugPrint(
        "Latituted: ${googleMapCon.latitute} - Longtitude: ${googleMapCon.longtitute}");

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                "event_id": eventId,
                "member_id":
                    customerController.customer.value.customerId.toString(),
                "origin":
                    "${googleMapCon.latitute.toString()}, ${googleMapCon.longtitute.toString()}",
                "view_ticket": 0
              }))
          .then((response) {
        if (response.statusCode == 200) {
          onRefreshEventDetail(id: eventId);

          var responseJson = json.decode(response.body);

          isRegister.value = responseJson['success'];

          eventTicket.value = EventTicket.fromJson(responseJson);
        } else if (response.statusCode == 422) {
          var isAvailableZone = json.decode(response.body)['errors']['origin'];
          var registerStatus =
              json.decode(response.body)['errors']['member_id'];

          var availableEvent = json.decode(response.body)['errors']['event_id'];

          if (isAvailableZone != null) {
            showNotifyPopUp(
              context: Get.context,
              title: 'The zone is not available',
              imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
            );
            eventTicket.value = EventTicket();
            isRegister(false);
          } else if (registerStatus != null) {
            eventTicket.value = EventTicket();
            showNotifyPopUp(
              secondButton: 'Register Now',
              onTap: () {
                final EventDetailArgument argument =
                    EventDetailArgument(id: eventId);
                Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL,
                    arguments: argument);
              },
              context: Get.context,
              title: 'You have not registered yet',
              imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
              description:
                  'Your name can\'t be found in the registration list. If you have not registered, please kindly register before scanning this QR code.',
            );
          } else if (availableEvent != null) {
            showNotifyPopUp(
              context: Get.context,
              title: 'Past Event',
              imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
              description:
                  'The event you are scanning has already taken place. Please check the list of our upcoming events and we hope to see you there.',
            );
            eventTicket.value = EventTicket();
            isRegister(false);
          }
        }
      });
    } catch (e) {
      return Future.error(e);
    } finally {
      isLoadingTicket(false);
    }
    return eventTicket.value;
  }

  final isLoadingZoneSetting = false.obs;

  Future<num> fetchZoneSetting() async {
    isLoadingZoneSetting(true);
    num availableZone = 0;
    final token = await LocalData.getCurrentUser();
    final url = '${FlavorConfig.instance.values!.apiBaseUrlV3}event-setting';

    try {
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          availableZone = responseJson['available_zone'];
        } else {}
      });
    } catch (e) {
      return Future.error(e);
    } finally {
      isLoadingZoneSetting(false);
    }
    return availableZone;
  }

  final eventShortenUrl = ''.obs;

  Future<EventData> fetchEventDetail(int id) async {
    isLoadingEventDetail(true);
    final url = '${FlavorConfig.instance.values!.apiBaseUrlV3}event/$id';
    final token = await LocalData.getCurrentUser();
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) async {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          eventDetail.value = EventData.fromJson(responseJson);
          // DynamicLinkService  not work so i command
          Uri uri = await DynamicLinkService.createDynamicLink(
              path: 'event/${eventDetail.value.id}',
              description: '${eventDetail.value.title}',
              image: '${eventDetail.value.cover}',
              forSocialLink: true,
              isShort: true);
          eventShortenUrl.value = uri.toString();
        } else {}
      });
    } catch (e) {
      isLoadingEventDetail(false);
      return Future.error('Error: $e');
    } finally {
      isLoadingEventDetail(false);
    }
    return eventDetail.value;
  }

  onRefreshEventDetail({int? id}) async {
    eventDetail.value = EventData();
    await fetchEventDetail(id!);
  }

  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  //register with guest event
  final guestModel = GuestModel().obs;
  onClearGuest() {
    guestModel.value.participantName = '';
    guestModel.value.phone = '';
    guestModel.value.relationshipId;
  }

  final currentIndex = 0.obs;
  final guestName = ''.obs;
  final guestPhone = ''.obs;
  // final guestRelationship = ''.obs;
  final isLoadingRegisterWithGuest = false.obs;
  final guestlistmodel = <GuestModel>[GuestModel()].obs;
  final getRegisterModel = GetRegisterModel().obs;
  final getListGest = <GuestListModel>[].obs;
  final guestListModel = GuestListModel().obs;
  final modelGuest = GuestModel().obs;

// Register Guest updated by Chhany
  Future<void> onRegisterWithGuest(
      {int? memberId,
      int? eventId,
      // List<Map>? guest,
      BuildContext? context}) async {
    debugPrint("on register is work1");

    isLoadingRegisterWithGuest(true);
    await apiBaseHelper.onNetworkRequesting(
      methode: METHODE.post,
      isAuthorize: true,
      url: 'event-registration',
      body: {
        "member_id": memberId,
        "event_id": eventId,
        "guest": guestlistmodel.map((e) {
          return {
            "phone_number": e.phone,
            "participant_name": e.participantName,
            "relationship": 230
          };
        }).toList()
      },
    ).then((res) {
      debugPrint("on register is work2");
      registermemberList.clear();
      var responseJson = res['ticket'];
      getRegisterModel.value = GetRegisterModel.fromJson(responseJson);
      // updated by Chhany
      getListGest.clear();
      getRegisterModel.value.guest!.map((e) {
        getListGest.add(e);
      }).toList();

      customRouterSnackbar(
          description: "Successfully registered",
          onTap: () {
            onShowCustomCupertinoModalSheet(
              context: context,
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              isColorsAppBar: Theme.of(context!).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              title: "Your Ticket",
              titleColors: AppColor.arrowforwardColor['dark'],
              child:
                  // const EventSubmitDoneScreen()
                  const EventCheckInTicket(
                selectCheckIn: 'view_ticket',
              ),
            );
          });

      fetchEventDetail(memberId!);
      eventDetail.value.isRegister = true;
      Navigator.pop(context!);
      onClearGuest();
      isLoadingRegisterWithGuest(false);
      /////clear data on textfile
      guestlistmodel.value = <GuestModel>[GuestModel()];
      refresh();
      update();
    }).onError((ErrorModel error, stackTrace) {
      isLoadingRegisterWithGuest(false);
    });
  }

////submit check in
  final isLoadingCheckIn = false.obs;
  Future<void> onCheckInEvent({int? eventId, BuildContext? context}) async {
    isLoadingCheckIn(true);

    List<Map<String, dynamic>> submitList = [];

    selectCheckInModel.map((element) {
      submitList.add(element.copyWith().toJson());
    }).toList();

    final submitguest = json.encode(submitList);

    await apiBaseHelper.onNetworkRequesting(
        methode: METHODE.post,
        isAuthorize: true,
        url: 'event-checkin-guest',
        body: {
          "event_id": eventId,
          "member_id": customerController.customer.value.customerId,
          "guest": submitguest,
          "origin":
              "${googleMapCon.latitute.toString()}, ${googleMapCon.longtitute.toString()}",
        }).then((res) {
      debugPrint("check in successfull::$res");
      getRegisterModel.value = GetRegisterModel.fromJson(res['data']);
      // updated by Chhany
      getListGest.clear();
      getRegisterModel.value.guest!.map((e) {
        getListGest.add(e);
      }).toList();
      customRouterSnackbar(
          description: "Successfully Check in.",
          onTap: () {
            onShowCustomCupertinoModalSheet(
              context: context,
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              isColorsAppBar: Theme.of(context!).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              title: "Your Ticket",
              titleColors: AppColor.arrowforwardColor['dark'],
              child:
                  // const EventSubmitDoneScreen()
                  const EventCheckInTicket(
                selectCheckIn: 'view_ticket',
              ),
            );
          });
      isLoadingCheckIn(false);
    }).onError((ErrorModel error, stackTrace) {
      if (error.statusCode == 422) {
        var isAvailableZone = error.bodyString['errors']['origin'];

        var registerStatus = error.bodyString['errors']['member_id'];
        debugPrint("Error body event checkin1:${error.bodyString}");

        var availableEvent = error.bodyString['errors']['event_id'];
        debugPrint("Error body event checkin 1");
        if (isAvailableZone != null) {
          showNotifyPopUp(
            context: context,
            title: 'The zone is not available',
            imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
          );
          eventTicket.value = EventTicket();
          isRegister(false);
        } else if (registerStatus != null) {
          fetchEventDetail(eventId!);
          debugPrint("Error body event checkin 2");
          eventTicket.value = EventTicket();
          showNotifyPopUp(
            secondButton: 'Register Now',
            onTap: () {
              onShowCustomCupertinoModalSheet(
                context: context,
                title: 'Register',
                icon: const Icon(Icons.clear),
                child: CustomRegisterForm(
                  eventID: eventId,
                  contextRegisterTicket: context,
                ),
              );
            },
            context: context,
            title: 'You have not registered yet',
            imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
            description:
                'Your name can\'t be found in the registration list. If you have not registered, please kindly register before scanning this QR code.',
          );
        } else if (availableEvent != null) {
          showNotifyPopUp(
            context: context,
            title: 'Past Event',
            imgUrl: 'assets/images/svgfile/not regicter Icon.svg',
            description:
                'The event you are scanning has already taken place. Please check the list of our upcoming events and we hope to see you there.',
          );
          eventTicket.value = EventTicket();
          isRegister(false);
        }
        isLoadingCheckIn(false);
      }
    });
    //remove submitted list after submit
    selectCheckInModel.clear();
  }

  //Get register guest updated by Chhany
  final isLoadingGetRegister = false.obs;
  final isLoadingGetRegisterCheckIn = false.obs;
  Future<GetRegisterModel> getRegisterWithGuest(int? id,
      {bool? isCheckIn = false}) async {
    //  is check in use for disable loading
    if (isCheckIn == false) {
      isLoadingGetRegister(true);
    } else {
      isLoadingGetRegisterCheckIn(true);
    }

    await apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url:
                'event-guest/register?event_id=$id&member_id=${customerController.customer.value.customerId}')
        .then((res) {
      var responseJson = res['data'];
      getRegisterModel.value = GetRegisterModel.fromJson(responseJson);
      getListGest.clear();
      getRegisterModel.value.guest!.map((e) {
        getListGest.add(e);
      }).toList();
      //  is check in use for disable loading
      if (isCheckIn == false) {
        isLoadingGetRegister(false);
      } else {
        isLoadingGetRegisterCheckIn(false);
      }
    }).onError((ErrorModel error, stackTrace) {
      //  is check in use for disable loading
      if (isCheckIn == false) {
        isLoadingGetRegister(false);
      } else {
        isLoadingGetRegisterCheckIn(false);
      }
    });

    return getRegisterModel.value;
  }

  final isLoadingCheckInGuest = false.obs;

  Future<GetRegisterModel> getCheckInGuest({
    int? eventId,
    int? memberId,
  }) async {
    isLoadingCheckInGuest(true);
    await apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url: 'event-view/ticket?event_id=$eventId&member_id=$memberId')
        .then((res) {
      var responseJson = res['data'];
      getRegisterModel.value = GetRegisterModel.fromJson(responseJson);
      getListGest.clear();
      getRegisterModel.value.guest!.map((e) {
        getListGest.add(e);
      }).toList();
      isLoadingCheckInGuest(false);
    }).onError((ErrorModel error, stackTrace) {
      isLoadingCheckInGuest(false);
    });

    return getRegisterModel.value;
  }

  var selectCheckInModel = <SelectCheckInModel>[].obs;
////====================Add more relationship
  final optionCon = Get.put(DocumentCategory());
  // final int? guestRelationship;
  String? relationshipDisplay;
  TextEditingController addNewOtherRelationShip =
      TextEditingController(text: 'Spouse Only');
  final isCreateNew = false.obs;
  final isLoadingMoreRelationship = false.obs;
  Future<void> onAddMoreRelationship(BuildContext context) async {
    isLoadingMoreRelationship(true);
    await apiBaseHelper.onNetworkRequesting(
        methode: METHODE.post,
        isAuthorize: true,
        url: 'option',
        body: {'relationship': addNewOtherRelationShip.text}).then((response) {
      debugPrint('option+++++++++:${addNewOtherRelationShip.text}');
      debugPrint('option+++++++++:${addNewOtherRelationShip.text}');

      isLoadingMoreRelationship(false);
      // addNewOtherRelationShip.text = '';
      Navigator.pop(context);
      optionCon.fetchDocumentCategory();
    }).onError((ErrorModel error, stackTrace) {
      isLoadingMoreRelationship(false);
      debugPrint('option error+++++++++:${error.bodyString}');
    });
  }
}

class GuestModel {
  String? phone;
  String? participantName;
  int? relationshipId;
  String? relationShipDisplay;
  GuestModel(
      {this.phone = '',
      this.participantName = '',
      this.relationshipId,
      this.relationShipDisplay});
}

// class SelectCheckInModel {
//   String? checkId;
//   int? guestId;
//   SelectCheckInModel({this.checkId, this.guestId});
// }
