import 'dart:async';
import 'dart:convert';
import 'package:cicgreenloan/Utils/helper/custom_route_snackbar.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/notify_share_pop_up.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
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
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/card_guests_model.dart';
import '../models/event_check_in_model.dart';

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
  final eventShortenUrl = ''.obs;
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

  List<EventCheckInModel> eventCheckIn = [
    EventCheckInModel(
      title: 'Name',
      description: 'Suman Mcarthur',
    ),
    EventCheckInModel(
      title: 'Event',
      description: 'Real Estate Networking',
    ),
    EventCheckInModel(
      title: 'Date and Time',
      description: '07 March 2021 at 3:00 PM - 4:00 PM',
    ),
    EventCheckInModel(
      title: 'Location',
      description:
          '#14, Floor 3th, Street 253, Phum 3, Sangkat beung Kak Khan Toul Kork, Phnom Penh',
    )
  ].obs;

  List<CardGuestsModel> cardGuestsList = [
    CardGuestsModel(
      guest: 'Guest 1',
      nameGuest: 'Kim Oan',
      who: 'Daughter',
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
    ),
  ].obs;
  Future<List<EventData>> getPastEvent(int? memberId) async {
    isLoadingPast(true);
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().getValue('api_base_urlv3')}event?member_id=$memberId&posted=past';

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

  Future<List<EventData>> getNewEvent(int memberId) async {
    // debugPrint("is working new event");
    isLoadingNew(true);

    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().getValue('api_base_urlv3')}event?member_id=$memberId&posted=upcoming&type=new';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
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
        '${GlobalConfiguration().getValue('api_base_urlv3')}event?member_id=$memberId&posted=past&search=$search';

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

  Future<List<EventData>> onSearchUpComingEvent(
      int memberId, String search) async {
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().getValue('api_base_urlv3')}event?member_id=$memberId&posted=upcoming&search=$search';
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
          responseJson.map((e) {
            newEvent.value = EventData.fromJson(e);
            newDataList.add(newEvent.value);
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
        '${GlobalConfiguration().getValue('api_base_urlv3')}event?member_id=$memberId&posted=upcoming&type=featured';

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
        '${GlobalConfiguration().getValue('api_base_urlv3')}registration?event_id=$eventId';

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

    String url = '${GlobalConfiguration().get('api_base_urlv3')}registration';

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
        '${GlobalConfiguration().get('api_base_urlv3')}event/interested/$eventid';

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
        '${GlobalConfiguration().get('api_base_urlv3')}event/uninterested/$eventid';

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
        '${GlobalConfiguration().get('api_base_urlv3')}event/interested/$eventid';

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

    String url = '${GlobalConfiguration().get('api_base_urlv3')}event/check-in';

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
          onRefreshEventDetail(eventId);

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
    final url = '${GlobalConfiguration().get('api_base_urlv3')}event-setting';

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

  Future<EventData> fetchEventDetail(int id) async {
    isLoadingEventDetail(true);
    final url = '${GlobalConfiguration().get('api_base_urlv3')}event/$id';
    final token = await LocalData.getCurrentUser();
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) async {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          debugPrint("Response Json: $responseJson");
          eventDetail.value = EventData.fromJson(responseJson);
          Uri uri = await DynamicLinkService.createDynamicLink(
              path: '/setting/event/event-detail/${eventDetail.value.id}',
              description: '${eventDetail.value.title}',
              image: '${eventDetail.value.cover}');
          eventShortenUrl.value = uri.toString();
        } else {}
      });
    } catch (e) {
      return Future.error('Error: $e');
    } finally {
      isLoadingEventDetail(false);
    }
    return eventDetail.value;
  }

  onRefreshEventDetail(int id) async {
    eventDetail.value = EventData();
    await fetchEventDetail(id);
  }
}
