import 'package:bform/bform.dart';

class LocaleModel extends BformObj {
  final int localeId;
  final String localeTitle;
  final String localeSubtitle;
  final String localeImagePath;

  LocaleModel({
    required this.localeId,
    required this.localeTitle,
    required this.localeSubtitle,
    required this.localeImagePath,
  });

  @override
  int get id => localeId;

  @override
  String get imagePath => localeImagePath;

  @override
  bool isSame(BformObj value) {
    return localeId == value.id;
  }

  @override
  String get subtitle => localeSubtitle;

  @override
  String get title => localeTitle;
}

List<LocaleModel> localesModels = [
  LocaleModel(
    localeId: 1,
    localeTitle: 'en',
    localeSubtitle: 'English',
    localeImagePath: 'assets/images/flags/flag_en_us.png',
  ),
  LocaleModel(
    localeId: 2,
    localeTitle: 'pt',
    localeSubtitle: 'Português',
    localeImagePath: 'assets/images/flags/flag_pt_pt.png',
  ),
];
