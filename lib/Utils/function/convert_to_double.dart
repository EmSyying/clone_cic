double onConvertToDouble(String value) {
  var valuee = value.replaceAll(",", ".");
  var doubleValue = double.parse(valuee);
  return doubleValue;
}
