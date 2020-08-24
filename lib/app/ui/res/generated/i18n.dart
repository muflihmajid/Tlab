// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }
  
  String get app_name {
    return Intl.message("Lancong", name: 'app_name');
  }

  String get app_subjudul {
    return Intl.message("lancong.id", name: 'app_subjudul');
  }

  String get profile_title {
    return Intl.message("Profile", name: 'profile_title');
  }

  String get home_bar {
    return Intl.message("Home", name: 'home_bar');
  }

  String get tourism {
    return Intl.message("Torism", name: 'tourism');
  }

  String get profile_bar {
    return Intl.message("Profile", name: 'profile_bar');
  }

  String get input_placeholder_employee {
    return Intl.message("Username", name: 'input_placeholder_employee');
  }

  String get input_placeholder_password {
    return Intl.message("Password", name: 'input_placeholder_password');
  }

  String get label_enter {
    return Intl.message("Login", name: 'label_enter');
  }

  String get kota {
    return Intl.message("Kota", name: 'kota');
  }

  String get notFound {
    return Intl.message("Kota yang anda cari tidak ditemukan", name: 'notFound');
  }

  String get apikey {
    return Intl.message("Api Key anda salah", name: 'apikey');
  }

  String get failed {
    return Intl.message("gagal", name: 'failed');
  }

  String get search {
    return Intl.message("cari", name: 'search');
  }

  String get perkiraan {
    return Intl.message("Perkiraan hari ini", name: 'perkiraan');
  }

  String get perkiraan5 {
    return Intl.message("Perkiraan hari yang akan datang ", name: 'perkiraan5');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("id", ""),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps
