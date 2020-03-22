

import 'package:flutter/material.dart';

import 'demoLocalizationsDelegate.dart';

class DemoLocalizations {
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String getText(String key) => language[key];
}