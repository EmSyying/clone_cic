enum GuideKey {
  bonus,
  equity,
  fif,
  trading,
  report,
  directory,
}

extension GuideExtension on GuideKey {
  String get key => toString().split('.').last;
}
