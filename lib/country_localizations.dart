import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryLocalizations {
  final Locale locale;

  CountryLocalizations(this.locale);

  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  late Map<String, String> _localizedStrings;
  late Map<String, String> _localizedStringsEnglish;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'packages/country_code_picker/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    String jsonStringEnglish = await rootBundle
        .loadString('packages/country_code_picker/i18n/en.json');
    Map<String, dynamic> jsonMapEnglish = json.decode(jsonStringEnglish);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    _localizedStringsEnglish = jsonMapEnglish.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String? key) {
    return _localizedStrings[key!];
  }

  String? translateInEnglish(String? key) {
    return _localizedStringsEnglish[key!];
  }
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      "af",
      "am",
      "ar",
      "az",
      "be",
      "bg",
      "bn",
      "bs",
      "ca",
      "cs",
      "da",
      "de",
      "el",
      "en",
      "es",
      "et",
      "fa",
      "fi",
      "fr",
      "gl",
      "ha",
      "he",
      "hi",
      "hr",
      "hu",
      "hy",
      "id",
      "is",
      "it",
      "ja",
      "ka",
      "kk",
      "km",
      "ko",
      "ku",
      "ky",
      "lt",
      "lv",
      "mk",
      "ml",
      "mn",
      "ms",
      "nb",
      "nl",
      "nn",
      "no",
      "pl",
      "ps",
      "pt",
      "ro",
      "ru",
      "sd",
      "sk",
      "sl",
      "so",
      "sq",
      "sr",
      "sv",
      "ta",
      "tg",
      "th",
      "tk",
      "tr",
      "tt",
      "uk",
      "ug",
      "ur",
      "uz",
      "vi",
      "zh",
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryLocalizations> load(Locale locale) async {
    CountryLocalizations localizations = CountryLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
