import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';
import '../models/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;

  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BookCubit>().goBackToList();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              book.imageUrl,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
            const SizedBox(height: 20),
            Text(book.title, style: Theme.of(context).textTheme.titleLarge),
            Text('by ${book.author}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}
