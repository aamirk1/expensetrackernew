import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:expensetracker/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    userRepository: FirebaseUserRepo(),
  ));
}