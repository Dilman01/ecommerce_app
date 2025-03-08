import 'package:ecommerce_app/core/common/app/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref().init();

  await initDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = AppBlocObserver();

  runApp(const EcommerceApp());
}
