checkFormatPhoneNumber(String phoneNumber) {
  String? phoneNumberAfterFormat;
  if (phoneNumber.contains('+855')) {
    String subStringPhoneNumber = phoneNumber.substring(4);
    if (subStringPhoneNumber.length == 8) {
      phoneNumberAfterFormat =
          "0${subStringPhoneNumber.substring(0, 2)} ${subStringPhoneNumber.substring(2, 5)} ${subStringPhoneNumber.substring(5, 8)}";
    } else if (subStringPhoneNumber.length == 9) {
      phoneNumberAfterFormat =
          "0${subStringPhoneNumber.substring(0, 3)} ${subStringPhoneNumber.substring(3, 6)} ${subStringPhoneNumber.substring(6, 9)}";
    }
  } else {
    if (phoneNumber.startsWith('0')) {
      String subStringPhoneNumber = phoneNumber.substring(1);
      if (subStringPhoneNumber.length == 8) {
        phoneNumberAfterFormat =
            "0${subStringPhoneNumber.substring(0, 2)} ${subStringPhoneNumber.substring(2, 5)} ${subStringPhoneNumber.substring(5, 8)}";
      } else if (subStringPhoneNumber.length == 9) {
        phoneNumberAfterFormat =
            "0${subStringPhoneNumber.substring(0, 3)} ${subStringPhoneNumber.substring(3, 6)} ${subStringPhoneNumber.substring(6, 9)}";
      }
    } else {
      String subStringPhoneNumber = phoneNumber;
      if (subStringPhoneNumber.length == 8) {
        phoneNumberAfterFormat =
            "0${subStringPhoneNumber.substring(0, 2)} ${subStringPhoneNumber.substring(2, 5)} ${subStringPhoneNumber.substring(5, 8)}";
      } else if (subStringPhoneNumber.length == 9) {
        phoneNumberAfterFormat =
            "0${subStringPhoneNumber.substring(0, 3)} ${subStringPhoneNumber.substring(3, 6)} ${subStringPhoneNumber.substring(6, 9)}";
      }
    }
  }
  return phoneNumberAfterFormat;
}
