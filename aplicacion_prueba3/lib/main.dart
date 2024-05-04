import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/ingreso_cliente.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB0s9-dau2YfEFzp0mpmKFwU59ntHwMzWU",
      authDomain: "prueba3-72c15.firebaseapp.com",
      projectId: "prueba3-72c15",
      storageBucket: "prueba3-72c15.appspot.com",
      messagingSenderId: "785539076059",
      appId: "1:785539076059:web:d5d689c6eecc18a22de1fe",
      measurementId: "G-1JTCBSB8KT",
    ),
  );
  runApp(MyApp());
}
