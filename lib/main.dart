import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/book_cubit.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const BookClubApp());
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: MaterialApp(
        title: 'Book Club App',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
