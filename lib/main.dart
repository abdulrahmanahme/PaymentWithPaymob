import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/cubit/bloc_observer/bloc_observer.dart';
import 'package:payment/modules/screens/register_screen.dart';
import 'package:payment/shared/network/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await DioHelperPayment.initial();
 Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayMent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}
