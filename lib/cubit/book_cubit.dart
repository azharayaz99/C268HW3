import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';

enum BookViewMode { author, title, detail }

class BookState {
  final List<Book> books;
  final BookViewMode viewMode;
  final Book? selectedBook;

  BookState({
    required this.books,
    required this.viewMode,
    this.selectedBook,
  });
}

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState(books: [], viewMode: BookViewMode.author)) {
    loadBooks();
  }

  void loadBooks() {
    final books = [
      Book(
        title: "To Kill A Mockingbird",
        author: "Harper Lee",
        description: "To Kill a Mockingbird by Harper Lee is a coming-of-age story set in the racially segregated American South during the 1930s. It follows young Scout Finch, her brother Jem, and their father Atticus, a principled lawyer who defends Tom Robinson, a Black man falsely accused of raping a white woman. Through Scout’s eyes, the novel explores themes of racial injustice, morality, and empathy, highlighting the prejudice and loss of innocence in their small town of Maycomb, Alabama. The mysterious neighbor Boo Radley also plays a key role, ultimately teaching Scout a powerful lesson about understanding and compassion.",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFSonV74uA5XB2_TekYuHgEpbU-yOKVPHG5w&s",
      ),
      Book(
        title: "Go Set A Watchman",
        author: "Harper Lee",
        description: "Go Set a Watchman by Harper Lee is set in the 1950s and follows Jean Louise “Scout” Finch, now a grown woman living in New York, as she returns to her hometown of Maycomb, Alabama. There, she confronts painful truths about her father, Atticus Finch, who is revealed to hold segregationist views, shattering her idealized image of him. The novel explores themes of disillusionment, personal conscience, and the complexities of social change in the South during the civil rights era. As Jean Louise struggles to reconcile her childhood beliefs with the reality of her father’s attitudes, she undergoes a difficult but necessary journey toward maturity and moral independence.",
        imageUrl: "https://m.media-amazon.com/images/I/71FvjHzolbL._AC_UF1000,1000_QL80_.jpg",
      ),
      Book(
        title: "Diary Of A Wimpy Kid",
        author: "Jeff Kinney",
        description: "Diary of a Wimpy Kid by Jeff Kinney is a humorous illustrated novel that follows Greg Heffley, a middle schooler who chronicles his daily life, struggles, and misadventures in a personal journal. As he navigates the challenges of school, friendships, family, and popularity, Greg often finds himself in awkward and funny situations—usually caused by his own questionable decisions. Told with a blend of text and cartoon-style drawings, the story captures the relatable and often embarrassing moments of adolescence with wit and charm, making it a favorite among young readers.",
        imageUrl: "https://m.media-amazon.com/images/I/615ewwnsdIL.jpg",
      ),
      Book(
        title: "Thinking Fast And Slow",
        author: "Daniel Kahneman",
        description: "Thinking, Fast and Slow by Daniel Kahneman explores how the human mind operates through two systems of thinking: System 1, which is fast, intuitive, and emotional, and System 2, which is slower, more deliberate, and logical. Kahneman, a Nobel Prize–winning psychologist, examines how these systems influence decision-making, often leading to cognitive biases and errors in judgment. Drawing on decades of research in psychology and behavioral economics, the book reveals the flaws in our reasoning, the impact of heuristics, and the ways we can improve critical thinking. It challenges the idea of human rationality and offers insights into how we think, choose, and act in everyday life.",
        imageUrl: "https://m.media-amazon.com/images/I/71f6DceqZAL.jpg",
      ),
    ];

    emit(BookState(books: books, viewMode: BookViewMode.author));
  }

  void sortByAuthor() {
    final sorted = [...state.books]..sort((a, b) => a.author.compareTo(b.author));
    emit(BookState(books: sorted, viewMode: BookViewMode.author));
  }

  void sortByTitle() {
    final sorted = [...state.books]..sort((a, b) => a.title.compareTo(b.title));
    emit(BookState(books: sorted, viewMode: BookViewMode.title));
  }

  void showDetail(Book book) {
    emit(BookState(books: state.books, viewMode: BookViewMode.detail, selectedBook: book));
  }

  void goBackToList() {
    emit(BookState(books: state.books, viewMode: state.viewMode)); // retains current sort
  }
}