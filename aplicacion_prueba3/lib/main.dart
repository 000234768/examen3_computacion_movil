import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/ingreso_cliente.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await connectFirebase();
  runApp(const MyApp());

}

Future<FirebaseApp> connectFirebase() async {
  return await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "AIzaSyB0s9-dau2YfEFzp0mpmKFwU59ntHwMzWU",
    authDomain: "prueba3-72c15.firebaseapp.com",
    projectId: "prueba3-72c15",
    storageBucket: "prueba3-72c15.appspot.com",
    messagingSenderId: "785539076059",
    appId: "1:785539076059:web:d5d689c6eecc18a22de1fe",
    measurementId: "G-1JTCBSB8KT",
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autenticación',
       initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
