import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/providers/carrito_compras.dart'; // Importa la clase CarritoCompras
import 'package:provider/provider.dart'; // Importa el paquete provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await connectFirebase();
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CarritoCompras(), // Crea una instancia de CarritoCompras
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Autenticación',
        initialRoute: '/ingreso_cliente', // Cambia esta línea
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
