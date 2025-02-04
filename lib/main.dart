import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.instance.init();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const EcommerceApp());
}
