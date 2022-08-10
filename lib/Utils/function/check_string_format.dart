checkPhoneNumber(String str) {
  if (str[0] == "0") {
    return str.substring(1);
  }
  return '0$str';
}
