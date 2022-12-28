import 'package:cicgreenloan/modules/privilege_program/privilege_export.dart';
import 'package:cicgreenloan/modules/wallet/wallet_export.dart';
import 'package:go_router/go_router.dart';

import '../../modules/event_module/screen/event.dart';
import '../../modules/event_module/screen/event_detail.dart';
import '../../modules/google_map_module/google_map.dart';
import 'route_repository.dart';

class CICRoute extends MainRoute {
  CICRoute._();

  ///instance member of classs
  static final instance = CICRoute._();

  @override
  GoRoute transferToMMA({required String fromWhere}) => GoRoute(
        path: 'transfer-to-other-mmacount',
        name: '${fromWhere}TransferToMMA',
        builder: (_, state) => TransferToMMA(
          receiverAccount: state.queryParams['receiverAccount'],
          receiverAmount: state.queryParams['receiverAmount'],
        ),
        routes: [
          GoRoute(
            path: 'review-transfer',
            name: '${fromWhere}ReviewTransfer',
            //_,__ just because arguments are not used
            builder: (_, __) => const TransferReview(),
          ),
        ],
      );

  @override
  GoRoute privilagePayment({required String? fromWhere}) => GoRoute(
        name: '${fromWhere}PrivilegePayment',
        path: 'privilege-payment/:id',
        builder: (_, state) => PrivilegePayment(
          key: state.pageKey,
          id: int.tryParse(state.params['id'] ?? '0'),
        ),
        routes: [
          GoRoute(
            name: '${fromWhere}PaymentDoneScreen',
            path: 'payment-done-screen',
            builder: (_, state) => PaymentDoneScreen(key: state.pageKey),
          ),
        ],
      );

  @override
  GoRoute event({required String fromWhere, bool isRoot = false}) => GoRoute(
        path: '${isRoot ? '/' : ''}event',
        name: '${fromWhere}Event',
        pageBuilder: (_, state) => NoTransitionPage(
          key: state.pageKey,
          name: state.name,
          child: const EventScreen(),
        ),
        routes: [
          GoRoute(
            path: ':id',
            name: '${fromWhere}EventDetail',
            builder: (_, state) => EventDetail(
                eventId: int.tryParse(
                  state.params['id'].toString(),
                ),
                key: state.pageKey),
            routes: [
              GoRoute(
                path: 'view-map',
                name: '${fromWhere}ViewMap',
                builder: (_, state) => GoogleMapsPage(
                    title: state.queryParams['title'],
                    latitude: double.tryParse(
                        state.queryParams['latitude'].toString()),
                    longtitude: double.tryParse(
                        state.queryParams['longtitude'].toString()),
                    key: state.pageKey),
              ),
            ],
          ),
        ],
      );

  @override
  GoRoute privilege({required String fromWhere, bool isRoot = false}) =>
      GoRoute(
        path: '${isRoot ? '/' : ''}privilege/:tabName',
        name: '${fromWhere}PrivilegeScreen',
        builder: (_, state) => PrivilegeScreen(
          tabName: state.params['tabName'],
          key: state.pageKey,
        ),
        routes: [
          GoRoute(
            path: 'privilege-detail/:id',
            name: '${fromWhere}PrivilegeDetailScreen',
            builder: (_, state) => PrivilegeDetailScreen(
              id: int.tryParse(state.params['id']!),
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: 'search-item',
            name: '${fromWhere}SearchScreen',
            builder: (_, state) => SearchScreen(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            name: '${fromWhere}PrivilegeFilters',
            path: 'filter-item',
            builder: (_, state) => PrivilegeFilters(
              key: state.pageKey,
            ),
          ),
          privilagePayment(fromWhere: '${fromWhere}Payment'),
          GoRoute(
            name: '${fromWhere}PaymentDoneScreen',
            path: 'payment-done-screen',
            builder: (_, state) => PaymentDoneScreen(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            name: '${fromWhere}PrivilegeSeeAllScreen',
            path: 'privilege-see-all',
            builder: (_, state) => PrivilegeSeeAllScreen(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            name: '${fromWhere}ItemCategoryPrivilegeScreen',
            path: 'privilege-item-category',
            builder: (_, state) => ItemCategoryPrivilegeScreen(
              tabTitle: state.queryParams['tabTitle'],
              id: int.tryParse(state.queryParams['id']!),
              key: state.pageKey,
            ),
          ),
          GoRoute(
            name: '${fromWhere}RedeemPointToPay',
            path: 'redeem-point-to-pay',
            builder: (_, state) => RedeemPointToPay(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            name: '${fromWhere}RedeemPointPayReviewScreen',
            path: 'redeem-point-pay-review',
            builder: (_, state) => RedeemPointPayReviewScreen(
              key: state.pageKey,
            ),
          ),
        ],
      );
}
