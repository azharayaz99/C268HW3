import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';
import '../widgets/book_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club'),
        actions: [
          TextButton(
            onPressed: () => context.read<BookCubit>().sortByAuthor(),
            child: const Text('Author', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => context.read<BookCubit>().sortByTitle(),
            child: const Text('Title', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state.viewMode == BookViewMode.detail && state.selectedBook != null) {
            return BookDetail(book: state.selectedBook!); // show detail widget
          }

          // default: list of books
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state.books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final book = state.books[index];
              return GestureDetector(
                onTap: () => context.read<BookCubit>().showDetail(book),
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        book.imageUrl,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          book.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(book.author),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
