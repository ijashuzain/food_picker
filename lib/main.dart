import 'package:flutter/material.dart';
import 'package:food_picker/src/core/app.dart';
import 'package:food_picker/src/core/di/di.dart';
import 'package:food_picker/src/core/services/local_storage_services/local_storage_services.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Env.dev);
  await LocalStorage.init();

  runApp(MyApp());
}
