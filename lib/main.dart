import 'package:bolanet76/app/modules/home/controllers/auth_controller.dart';
import 'package:bolanet76/app/modules/services/firebase_messaging_handler.dart';
import 'package:bolanet76/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // Inisialisasi Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  await Firebase.initializeApp();

  // Dependency Injection
  //DependencyInjection.init();

  // Inisialisasi AuthController
  Get.put(AuthController());

  // Inisialisasi Firebase Push Notification Handler
  FirebaseMessagingHandler firebaseMessagingHandler = FirebaseMessagingHandler();
  await firebaseMessagingHandler.initPushNotification();

  // Jalankan Aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Football News Application",
      initialRoute: AppPages.INITIAL, // Rute pertama yang dibuka
      getPages: AppPages.routes, // Semua rute yang didefinisikan
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
    );
  }
}