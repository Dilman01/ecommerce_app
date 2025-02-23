import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/ecommerce_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref().init();

  await initDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const EcommerceApp());
}
