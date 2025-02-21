import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  AppLocalStorage.init();
  runApp(const MyApp());
}
