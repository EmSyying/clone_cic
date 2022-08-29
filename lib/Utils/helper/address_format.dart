class AddressUtil {
  static addressFormat(String? address, {String symbol = ','}) {
    if (address != null && address != '') {
      return '$address$symbol ';
    } else {
      return ' ';
    }
  }

  static addressFullFormat(List<String?>? addressList, {String symbol = ','}) {
    String returnAddress = '';
    try {
      if (addressList != null && addressList.isNotEmpty) {
        returnAddress = '';
        addressList.asMap().entries.map(
          (e) {
            if (e.value != null && e.value!.isNotEmpty) {
              String format =
                  e.key == addressList.length - 1 ? e.value! : '${e.value}, ';
              returnAddress = returnAddress + format;
            }
          },
        ).toList();

        return returnAddress;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
