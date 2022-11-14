class CardGuestsModel {
  final String? guest;
  final String? nameGuest;
  final String? who;
   bool isCheckBox;
  CardGuestsModel(
      {this.guest, this.nameGuest, this.who, this.isCheckBox = false});
}
