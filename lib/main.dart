import 'package:flutter/material.dart';
import 'package:food_picker/src/core/app.dart';
import 'package:food_picker/src/core/di/di.dart';
import 'package:food_picker/src/core/services/local_storage_services/local_storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies(Env.dev);
  await LocalStorage.init();

  runApp(MyApp());
}
