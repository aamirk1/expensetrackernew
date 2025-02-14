
import 'package:expense_repository/expense_repository.dart';
import 'package:expensetracker/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:expensetracker/screens/auth/welcome_screen.dart';
import 'package:expensetracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade100,
              onBackground: Colors.black,
              primary: const Color(0xFF00B2E7),
              secondary: const Color(0xFFE064F7),
              tertiary: const Color(0xFFFF8D6C),
              outline: Colors.grey)),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
  builder: (context, state) {
    if (state.status == AuthenticationStatus.authenticated) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInBloc(
              userRepository: context.read<AuthenticationBloc>().userRepository,
            ),
          ),
          BlocProvider(
            create: (context) =>
                GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
          ),
        ],
        child: const HomeScreen(),
      );
    } else {
      return const WelcomeScreen();
    }
  },
)

    );
  }
}
