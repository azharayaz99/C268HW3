import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_image.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          BookImage(imageUrl: book.imageUrl),
          Text(book.title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
