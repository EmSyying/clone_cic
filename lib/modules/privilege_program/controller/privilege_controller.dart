import 'package:get/get.dart';

import '../../../Utils/helper/option_model/option_form.dart';
import '../model/category_model/model_categories.dart';
import '../model/stores_model/model_pre.dart';

class PrivilegeController extends GetxController {
  final favoritesList = <StoreModel>[].obs;
  final optionSelecList = <OptionForm>[].obs;
  final isSelectFilter = false.obs;
  final selectedCategFil = ''.obs;

  //final filterByTypeList = <OptionFormFilter>[].obs;

  final filterOption = <OptionForm>[
    OptionForm(id: 1, display: "Sihanouk VIlle"),
    OptionForm(id: 2, display: "Phnom Penh"),
    OptionForm(id: 3, display: "Siem Reap"),
    OptionForm(id: 4, display: "Ratanakiri"),
    OptionForm(id: 5, display: "Krong Kep"),
    OptionForm(id: 6, display: "Oddar Maenchey"),
    OptionForm(id: 7, display: "Banteay Meanchey"),
    OptionForm(id: 8, display: "Preah VIhear"),
    OptionForm(id: 9, display: "Kampong Spue"),
  ].obs;

  final listAllCategories = <ModelsCategories>[
    ModelsCategories(
      title: 'Education Training',
      svgPicture: 'assets/images/privilege/education.png',
    ),
    ModelsCategories(
      title: 'Retail Baby Product',
      svgPicture: 'assets/images/privilege/product.png',
    ),
    ModelsCategories(
      title: 'Construction Architect',
      svgPicture: 'assets/images/privilege/construction.png',
    ),
  ].obs;

  final listAllStores = <StoreModel>[
    StoreModel(
      steusTitle: 'OPEN NOW',
      titleStores: 'Champei Spa',
      description:
          'Turpis nisl et facilisis aliquam, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Sangkat Tuek Thla',
      descLocation: 'Sangkat Tuek Thla,Sangkat Tuek Thla,Sangkat Tuek Thla',
      imageStores:
          'https://ecs7.tokopedia.net/img/cache/800/ANWSwT/2021/12/6/30801d63-152b-4f97-9f60-1ab6624dba97.jpg',
      numberPercentage: 40,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
    StoreModel(
      steusTitle: 'OPEN NOW',
      titleStores: 'Pizza Hut',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Preak Ta Sek',
      descLocation: 'Preak Ta Sek, Phnom Penh, Preak Ta Sek, Phnom Penh',
      imageStores: 'https://pbs.twimg.com/media/E_5sA_QUcAsgDhg.jpg',
      numberPercentage: 50,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
    StoreModel(
      steusTitle: 'CLOSED',
      titleStores: 'Park Cafe',
      description:
          'Gravida sit tortor nisl fringilla porttitor viverra scelerisque, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Toul tom pung',
      descLocation:
          'Timberland, Shop G38, G/F, Mikiki, No. 638 Prince Edward Road East',
      imageStores:
          'https://images.deliveryhero.io/image/fd-kh/LH/t0oo-hero.jpg',
      numberPercentage: 15,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
  ].obs;
}
