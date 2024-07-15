import 'package:energy_trade/backend/services/back_end_system/user_cubit.dart';
import 'package:energy_trade/backend/services/back_end_system/user_models.dart';
import 'package:energy_trade/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // add widgets binding

  // init local storage

  // await native splash

  // initialize firebase

  // initialize authentication
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(BlocProvider(
  create: (context) => UserCubit(User()),
    child: const MyApp(),
  ));
}


//https://energy-trading-platform.onrender.com/api/login/Create
//https://energy-trading-platform.onrender.com/api/register/
//for login :      {
//     "email": "john.doe@example.com",
//     "password": "password123"
// }