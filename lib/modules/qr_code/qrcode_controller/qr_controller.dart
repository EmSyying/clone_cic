import 'package:cicgreenloan/modules/qr_code/qrcode_controller/qr_type.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  bool isCiCQr(var type) => CiCQr.values.contains(type);
}
