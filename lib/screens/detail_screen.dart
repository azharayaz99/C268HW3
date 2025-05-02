import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final book = state.selectedBook;
        if (book == null) return SizedBox.shrink();

        return Scaffold(
          appBar: AppBar(
            title: Text("Book Detail"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => context.read<BookCubit>().goBackToList(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(book.imageUrl),
                SizedBox(height: 10),
                Text(book.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(book.author),
                SizedBox(height: 10),
                Text(book.description),
              ],
            ),
          ),
        );
      },
    );
  }
}