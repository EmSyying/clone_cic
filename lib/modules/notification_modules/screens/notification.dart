import 'dart:async';
import 'dart:io';
import 'package:cicgreenloan/Utils/popupannouncement/popup_announcement.dart';
import 'package:cicgreenloan/modules/get_funding/controller/approve_payment_detail_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/modules/notification_modules/screens/announcement_detail.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:cicgreenloan/widgets/get_funding/payment/payment_info.dart';
import 'package:cicgreenloan/widgets/notification/notification_shimmer.dart';
import 'package:cicgreenloan/widgets/notification/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../../widgets/notification/accept_notification_pop_up.dart';
import '../../../widgets/ut_tradding/notification_detail_popup.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../../wallet/screen/wallet_transaction_popup_detail.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? deviceToken;
  Future<List<NotificationModel>>? notificationListFuture;
  final firebaseMessaging = FirebaseMessaging.instance;

  Map<String, dynamic> notificationList = <String, dynamic>{};
  List<Map<String, dynamic>> notificationlist = [];

  final _con = Get.put(NotificationController());
  final controller = Get.put(ApprovePaymentController());
  final _walletController = Get.put(WalletController());

  bool isLoading = true;
  final _keyRefresh = GlobalKey<RefreshIndicatorState>();
  dynamic items;
  List<String> notificationIdList = <String>[];

  @override
  void initState() {
    _con.getNotification();
    _con.countNotification();
    _con.onGetReason();

    firebaseMessaging.getToken().then((token) => setState(() {
          deviceToken = token;
        }));
    setState(() {
      notificationListFuture = _con.getNotification();
    });
    super.initState();
  }

  final String serverToken =
      'AAAAjhN5SfY:APA91bE-IRLKGTVEa21xdrg2nk1u-OGWSyAZ5Gk0GHrvzN7KlQ1CSNtVBmyvUcksTP1tyKxUL9s3eqDPGAgLD17vhn7755DrSBy8HLYMlBaZSS0A5WLyGKeAR27b50OilVdCw2K1_t3f';

  @override
  void didUpdateWidget(NotificationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  navigateToPaymentInfo() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaymentInfo(
                paymentSchedule: controller.paymentSchedule.value)));
  }

  Future<void> onRefreshData() async {
    setState(() {
      notificationListFuture = _con.getNotification();
    });
  }

  int _selectedSegment = 0;
  PageController pageviewController = PageController();

  int? getFundId;
  // static Timer? _session;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultSizeWeb(
      child: Builder(
        builder: (context) => CupertinoScaffold(
          body: CupertinoPageScaffold(
            child: Scaffold(
              body: Column(
                children: [
                  CustomAppBar(
                      isLeading: true,
                      context: context,
                      title: S.of(context).notificationMenu,
                      elevation: 1.0,
                      isLogo: false),
                  Obx(
                    () => Container(
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl(
                          groupValue: _selectedSegment,
                          backgroundColor:
                              const Color(0xff252552).withOpacity(0.1),
                          children: <int, Widget>{
                            0: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  width: width * 0.5,
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: const Text('Notifications'),
                                ),
                                _con.countReadNotification.value >= 1
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.only(top: 5, right: 5),
                                        child: CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: Colors.red,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                            1: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  width: width * 0.5,
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: const Text('Announcements'),
                                ),
                                _con.countReadAnnouncement.value >= 1
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.only(top: 5, right: 5),
                                        child: CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: Colors.red,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            )
                          },
                          onValueChanged: (int? value) {
                            setState(() {
                              _selectedSegment = value!;
                              pageviewController.animateToPage(value,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            });
                          }),
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: PageView(
                        controller: pageviewController,
                        onPageChanged: (v) {
                          setState(() {
                            _selectedSegment = v;
                          });
                        },
                        children: <Widget>[
                          _con.isLoadingNotification.value
                              ? const NotificationShimmer()
                              : _con.notificationList.isNotEmpty
                                  ? RefreshIndicator(
                                      key: _keyRefresh,
                                      onRefresh: onRefreshData,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: _con.notificationList.length,
                                        itemBuilder: (context, index) {
                                          items = _con.notificationList[index];
                                          return GestureDetector(
                                            onTap:
                                                _con.notificationList[index]
                                                            .data!.type ==
                                                        'Payment'
                                                    ? () {
                                                        notificationIdList
                                                            .clear();

                                                        setState(() {
                                                          _con
                                                              .notificationList[
                                                                  index]
                                                              .readAt = '';
                                                        });
                                                        controller
                                                            .fetchApprovePayment(_con
                                                                .notificationList[
                                                                    index]
                                                                .data!
                                                                .scheduleId!);

                                                        notificationIdList
                                                            .add(items.id);

                                                        _con.onReadNotification(
                                                            _con
                                                                .notificationList[
                                                                    index]
                                                                .id!);
                                                      }
                                                    : _con
                                                                .notificationList[
                                                                    index]
                                                                .data!
                                                                .type ==
                                                            'Announcement'
                                                        ? () {
                                                            setState(() {
                                                              _con
                                                                  .notificationList[
                                                                      index]
                                                                  .readAt = '';
                                                            });
                                                            notificationIdList
                                                                .clear();

                                                            _con.onReadNotification(_con
                                                                .notificationList[
                                                                    index]
                                                                .id!);
                                                            showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder: (context) =>
                                                                  PopUpAnnouncement(
                                                                notificationModel:
                                                                    _con.notificationList[
                                                                        index],
                                                              ),
                                                            );
                                                          }
                                                        : _con
                                                                        .notificationList[
                                                                            index]
                                                                        .data!
                                                                        .type ==
                                                                    'Disbursement' &&
                                                                _con
                                                                        .notificationList[
                                                                            index]
                                                                        .data!
                                                                        .verify! ==
                                                                    0
                                                            ? () {
                                                                _con.onReadNotification(_con
                                                                    .notificationList[
                                                                        index]
                                                                    .id!);
                                                                notificationIdList
                                                                    .clear();

                                                                kIsWeb
                                                                    ? showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text(
                                                                              _con.notificationList[index].data!.body!,
                                                                              style: Theme.of(context).textTheme.bodyLarge,
                                                                            ),
                                                                            actions: [
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Accept', _con.notificationList[index].id!);

                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text('Accept'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                  controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Reject', items.id);
                                                                                },
                                                                                child: const Text('Decline'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      )
                                                                    : Platform
                                                                            .isAndroid
                                                                        ? showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                title: Text(
                                                                                  _con.notificationList[index].data!.body!,
                                                                                  style: Theme.of(context).textTheme.bodyLarge,
                                                                                ),
                                                                                actions: [
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Accept', _con.notificationList[index].id!);

                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: const Text('Accept'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                      controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Reject', items.id);
                                                                                    },
                                                                                    child: const Text('Decline'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          )
                                                                        : showCupertinoDialog(
                                                                            builder: (BuildContext
                                                                                context) {
                                                                              return CupertinoAlertDialog(
                                                                                content: Text(
                                                                                  _con.notificationList[index].data!.body!,
                                                                                ),
                                                                                actions: [
                                                                                  CupertinoButton(
                                                                                    onPressed: () {
                                                                                      controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Accept', _con.notificationList[index].id!);

                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: const Text('Accept'),
                                                                                  ),
                                                                                  CupertinoButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                      controller.verifyDisbursment(_con.notificationList[index].data!.disbursementId!, 'Reject', items.id);
                                                                                    },
                                                                                    child: const Text('Decline'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                            context:
                                                                                context);
                                                                setState(() {
                                                                  _con
                                                                      .notificationList[
                                                                          index]
                                                                      .readAt = '';
                                                                });
                                                                notificationIdList
                                                                    .add(items
                                                                        .id);
                                                                _con.onReadNotification(_con
                                                                    .notificationList[
                                                                        index]
                                                                    .id!);
                                                              }
                                                            : _con.notificationList[index].data!.type ==
                                                                        'Disbursement' &&
                                                                    _con.notificationList[index].data!.verify ==
                                                                        1 &&
                                                                    _con.notificationList[index].data!.status !=
                                                                        'rejected'
                                                                ? () {
                                                                    notificationIdList
                                                                        .clear();

                                                                    controller.payAnnouncement(_con
                                                                        .notificationList[
                                                                            index]
                                                                        .data!
                                                                        .disbursementId!);
                                                                    notificationIdList
                                                                        .add(items
                                                                            .id);
                                                                    _con.onReadNotification(_con
                                                                        .notificationList[
                                                                            index]
                                                                        .id!);
                                                                    _con
                                                                        .notificationList[
                                                                            index]
                                                                        .readAt = '';
                                                                  }
                                                                : _con.notificationList[index].data!.status ==
                                                                        'Requested'
                                                                    ? () {
                                                                        notificationIdList
                                                                            .add(items.id);
                                                                        _con.onReadNotification(_con
                                                                            .notificationList[index]
                                                                            .id!);
                                                                        setState(
                                                                            () {
                                                                          _con.notificationList[index].readAt =
                                                                              '';
                                                                        });

                                                                        showDialog(
                                                                          barrierDismissible:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder: (context) =>
                                                                              AcceptNotificationPopup(
                                                                            notificationModel:
                                                                                _con.notificationList[index],
                                                                          ),
                                                                        );
                                                                      }
                                                                    : _con.notificationList[index].data!.status == 'Unmatched'
                                                                        ? () {
                                                                            notificationIdList.add(items.id);
                                                                            _con.onReadNotification(_con.notificationList[index].id!);
                                                                            setState(() {
                                                                              _con.notificationList[index].readAt = '';
                                                                            });
                                                                          }
                                                                        : _con.notificationList[index].data!.type == 'event-invitation'
                                                                            ? () {
                                                                                notificationIdList.add(items.id);
                                                                                _con.onReadNotification(_con.notificationList[index].id!);
                                                                                setState(() {
                                                                                  _con.notificationList[index].readAt = '';
                                                                                });
                                                                                context.go('/notification/event/${_con.notificationList[index].data!.eventId}');
                                                                              }
                                                                            : _con.notificationList[index].data!.type == 'transfer' || _con.notificationList[index].data!.type == 'subscription-payment'
                                                                                ? () {
                                                                                    notificationIdList.add(items.id);
                                                                                    _con.onReadNotification(_con.notificationList[index].id!);
                                                                                    setState(() {
                                                                                      _con.notificationList[index].readAt = '';
                                                                                    });
                                                                                  }
                                                                                : _con.notificationList[index].data!.type == 'ut-trading' && _con.notificationList[index].data!.status!.toLowerCase() == 'rejected'
                                                                                    ? () {
                                                                                        notificationIdList.add(items.id);
                                                                                        _con.onReadNotification(_con.notificationList[index].id!);
                                                                                        setState(() {
                                                                                          _con.notificationList[index].readAt = '';
                                                                                        });
                                                                                      }
                                                                                    : _con.notificationList[index].data!.status!.toLowerCase() == 'canceled'
                                                                                        ? () {
                                                                                            notificationIdList.add(items.id);
                                                                                            _con.onReadNotification(_con.notificationList[index].id!);
                                                                                            setState(() {
                                                                                              _con.notificationList[index].readAt = '';
                                                                                            });
                                                                                          }
                                                                                        : _con.notificationList[index].data!.type == 'Equity' && _con.notificationList[index].presentType == "Other"
                                                                                            ? () async {
                                                                                                notificationIdList.add(items.id);
                                                                                                _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                setState(() {
                                                                                                  _con.notificationList[index].readAt = '';
                                                                                                });
                                                                                                context.go("/notification/preview-equity?id=${_con.notificationList[index].data!.applicationId}");
                                                                                              }
                                                                                            : _con.notificationList[index].data!.type == 'Debt' && _con.notificationList[index].presentType == "Other"
                                                                                                ? () async {
                                                                                                    debugPrint("debt type:${_con.notificationList[index].data!.type}");
                                                                                                    notificationIdList.add(items.id);
                                                                                                    _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                    setState(() {
                                                                                                      _con.notificationList[index].readAt = '';
                                                                                                    });
                                                                                                    context.go("/notification/preview-debt?id=${_con.notificationList[index].data!.applicationId}");
                                                                                                  }
                                                                                                : _con.notificationList[index].data!.type == 'wallet-cashout' || _con.notificationList[index].data!.type == 'wallet-deposit' || _con.notificationList[index].data!.type == 'cash-out' || _con.notificationList[index].data!.type == 'confirm-subscription' || _con.notificationList[index].data!.type == 'confirm-payment' || _con.notificationList[index].data!.type == 'receiver' || _con.notificationList[index].data!.type == 'transferer' || _con.notificationList[index].data!.type == 'bonus' || _con.notificationList[index].data!.type == 'exchange' || _con.notificationList[index].data!.type == 'discount-claim' || _con.notificationList[index].data!.type == 'mvp'
                                                                                                    ? () async {
                                                                                                        if (_con.notificationList[index].data!.type == 'wallet-deposit' || _con.notificationList[index].data!.type == 'transferer' || _con.notificationList[index].data!.type == 'wallet-cashout' || _con.notificationList[index].data!.type == 'exchange') {
                                                                                                          notificationIdList.add(items.id);
                                                                                                          _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                          setState(() {
                                                                                                            _con.notificationList[index].readAt = '';
                                                                                                          });
                                                                                                          debugPrint("transactionDetailLoading00");
                                                                                                          _walletController.onFetchWalletTransactionDetail(_con.notificationList[index].data!.transactionId!, _con.notificationList[index].data!.model!).then((value) {
                                                                                                            WalletTran.transactionDetail(context, value);
                                                                                                          });

                                                                                                          // ignore: use_build_context_synchronously
                                                                                                          // WalletTran.transactionDetail(context, _walletController.walletTransactionDetail.value);
                                                                                                        } else if (_con.notificationList[index].data!.type == 'bonus') {
                                                                                                          notificationIdList.add(items.id);
                                                                                                          _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                          setState(() {
                                                                                                            _con.notificationList[index].readAt = '';
                                                                                                          });
                                                                                                          context.push('/wallet');
                                                                                                        } else if (_con.notificationList[index].data!.type == 'mvp') {
                                                                                                          notificationIdList.add(items.id);
                                                                                                          _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                          setState(() {
                                                                                                            _con.notificationList[index].readAt = '';
                                                                                                          });
                                                                                                          context.push('/mymvp');
                                                                                                        } else {
                                                                                                          notificationIdList.add(items.id);
                                                                                                          _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                          setState(() {
                                                                                                            _con.notificationList[index].readAt = '';
                                                                                                          });
                                                                                                        }
                                                                                                      }
                                                                                                    : _con.notificationList[index].data!.type == 'fif' || _con.notificationList[index].data!.type == 'withdraw' || _con.notificationList[index].data!.type == 'renew' || _con.notificationList[index].data!.type == 'fif-monthly-payment'
                                                                                                        ? () async {
                                                                                                            notificationIdList.add(items.id);
                                                                                                            _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                            setState(() {
                                                                                                              _con.notificationList[index].readAt = '';
                                                                                                            });
                                                                                                            if (_con.notificationList[index].data!.operation == "confirmed") {
                                                                                                              context.go('/notification/deposite-screen/${_con.notificationAnouncementList[index].data!.applicationId}');
                                                                                                            } else if (_con.notificationList[index].data!.operation == "reviewing" || _con.notificationList[index].data!.operation == "rejected") {
                                                                                                              context.go('/notification/deposite-screen/${_con.notificationAnouncementList[index].data!.applicationId}');
                                                                                                            } else {
                                                                                                              debugPrint('This Function is work');

                                                                                                              context.go('/notification/saving-detail', extra: {
                                                                                                                "id": _con.notificationList[index].data!.applicationId as num,
                                                                                                                "paddings": const EdgeInsets.only(top: 50, left: 10, right: 0),
                                                                                                                "fromPage": "Notification",
                                                                                                              });
                                                                                                            }
                                                                                                          }
                                                                                                        : () async {
                                                                                                            notificationIdList.add(items.id);
                                                                                                            _con.onReadNotification(_con.notificationList[index].id!);
                                                                                                            setState(() {
                                                                                                              _con.notificationList[index].readAt = '';
                                                                                                            });
                                                                                                            debugPrint("Notification Type:${_con.notificationList[index].data!.type}");
                                                                                                            await onShowCustomCupertinoModalSheet(
                                                                                                              context: context,
                                                                                                              icon: const Icon(Icons.close),
                                                                                                              title: _con.notificationList[index].data!.status == 'Submitted' && _con.notificationList[index].data!.operation == 'buy'
                                                                                                                  ? 'Submitted Buy Request'
                                                                                                                  : _con.notificationList[index].data!.status == 'Submitted' && _con.notificationList[index].data!.operation == 'sell'
                                                                                                                      ? 'Submitted Sell Request'
                                                                                                                      : _con.notificationList[index].data!.status == 'Matched' && _con.notificationList[index].data!.operation == 'buy'
                                                                                                                          ? "Successful Buy Request"
                                                                                                                          : _con.notificationList[index].data!.status == 'Matched' && _con.notificationList[index].data!.operation == 'sell'
                                                                                                                              ? "Successful Sell Request"
                                                                                                                              : "",
                                                                                                              child: NotificationDetailPopup(
                                                                                                                transitionId: _con.notificationList[index].data!.transactionId!,
                                                                                                                marketId: _con.notificationList[index].data!.marketId!,
                                                                                                                operation: _con.notificationList[index].data!.operation,
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                            child: NotificationWidget(
                                                notification: _con
                                                    .notificationList[index]),
                                          );
                                        },
                                      ),
                                    )
                                  : emptyState(),
                          _con.isLoadingNotification.value
                              ? const NotificationShimmer()
                              : _con.notificationAnouncementList.isNotEmpty
                                  ? RefreshIndicator(
                                      onRefresh: onRefreshData,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: _con
                                                          .notificationAnouncementList[
                                                              index]
                                                          .data!
                                                          .type ==
                                                      'fif-reminder'
                                                  ? () {
                                                      debugPrint(
                                                          "is pressed onn annnouncement first: ${_con.notificationAnouncementList[index].data!.type}");
                                                      context.go(
                                                          '/notification/deposite-screen/${_con.notificationAnouncementList[index].data!.applicationId}');

                                                      _con.onReadNotification(_con
                                                          .notificationAnouncementList[
                                                              index]
                                                          .id!);
                                                    }
                                                  : _con.notificationAnouncementList[index]
                                                              .data!.type ==
                                                          'Announcement'
                                                      ? () {
                                                          setState(() {
                                                            _con
                                                                .notificationAnouncementList[
                                                                    index]
                                                                .readAt = '';
                                                          });
                                                          notificationIdList
                                                              .clear();

                                                          _con.onReadNotification(_con
                                                              .notificationAnouncementList[
                                                                  index]
                                                              .id!);

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                              return AnnouncementDetail(
                                                                notificationData: _con
                                                                    .notificationAnouncementList[
                                                                        index]
                                                                    .data,
                                                              );
                                                            }),
                                                          );
                                                          // showDialog(
                                                          //   barrierDismissible:
                                                          //       false,
                                                          //   context: context,
                                                          //   builder: (context) =>
                                                          //       PopUpAnnouncement(
                                                          //     notificationModel:
                                                          //         _con.notificationAnouncementList[
                                                          //             index],
                                                          //   ),
                                                          // );
                                                        }
                                                      : () {
                                                          debugPrint(
                                                              "is pressed onn annnouncement1: ${_con.notificationAnouncementList[index].data!.type}");

                                                          notificationIdList
                                                              .add(items.id);
                                                          _con.onReadNotification(_con
                                                              .notificationAnouncementList[
                                                                  index]
                                                              .id!);
                                                          setState(() {
                                                            _con
                                                                .notificationAnouncementList[
                                                                    index]
                                                                .readAt = '';
                                                          });
                                                          // EventDetailArgument
                                                          //     argument =
                                                          //     EventDetailArgument(
                                                          //         id: _con
                                                          //             .notificationAnouncementList[
                                                          //                 index]
                                                          //             .data!
                                                          //             .eventId);
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         const EventDetail(),
                                                          //     settings:
                                                          //         RouteSettings(
                                                          //             arguments:
                                                          //                 argument),
                                                          //   ),
                                                          // );
                                                        },
                                              child: NotificationWidget(
                                                notification:
                                                    _con.notificationAnouncementList[
                                                        index],
                                              ),
                                            );
                                          },
                                          itemCount: _con
                                              .notificationAnouncementList
                                              .length),
                                    )
                                  : emptyState(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 150.0,
              width: 150.0,
              child: Image.asset('assets/images/emty_loan.png')),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'No notification yet',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Your Notification or Announcement will appear.',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
