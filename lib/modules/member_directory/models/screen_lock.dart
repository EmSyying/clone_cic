class ScreenLock {
  bool? temporary;
  int? tryIn;

  ScreenLock({this.temporary, this.tryIn});

  ScreenLock.fromJson(Map<String, dynamic> json) {
    temporary = json['temporary'];
    tryIn = json['try_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temporary'] = temporary;
    data['try_in'] = tryIn;
    return data;
  }
}
