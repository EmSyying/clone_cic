import 'package:go_router/go_router.dart';

abstract class MainRoute {
  GoRoute transferToMMA({required String fromWhere});
  GoRoute privilagePayment({required String fromWhere});
  GoRoute event({required String fromWhere, bool isRoot = false});
  GoRoute privilege({required String fromWhere, bool isRoot = false});
}
