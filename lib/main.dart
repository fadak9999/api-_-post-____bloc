import 'package:api_bloc/UserApiProvider.dart';
import 'package:api_bloc/bloc/api_bloc.dart';
import 'package:api_bloc/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) => ApiBloc(UserApiProvider()),  // تمرير UserApiProvider إلى ApiBloc
      child: MaterialApp(
        home: Home(),  
      ),
    );
  
  }
}
