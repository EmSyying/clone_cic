import 'dart:async';

class Debounce {
  ///This function only callback after delayed.
  ///```dart
  ///final _debounce = Debounce();
  ///
  ///onChanged(value){
  ///   _debounce.listener((){
  ///       //call your function
  ///   });
  ///}
  ///```
  Debounce([Duration? duration]) {
    if (duration != null) {
      _duration = duration;
    }
  }
  Duration _duration = const Duration(milliseconds: 800);

  Timer? _timer;
  void _handler(void Function() callback) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(_duration, callback);
  }

  void listener(void Function() callback) {
    _handler(callback);
  }
}
