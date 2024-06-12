import 'package:booksearch/api/books_api.dart';
import 'package:booksearch/models/book_model.dart';
import 'package:booksearch/widgets/book_widget.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String searchValue = '';
  Future<List<BookModel>> books = Books_Api.getSearchResults(searchValue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EasySearchBar(
        onSearch: (value) {
          books = Books_Api.getSearchResults(value);
          setState(() {});
        },
        title: const Text(
          "Books",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        elevation: 4,
        backgroundColor: const Color.fromRGBO(51, 175, 233, 0.8),
      ),
      body: FutureBuilder(
          future: books,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            }
            // 아직 books 를 불러오고 있다면 -> 화면중앙에 '대기중' 표시
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

// makeList 위젯
  GridView makeList(AsyncSnapshot<List<BookModel>> snapshot) {
    return GridView.builder(
      // scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        // crossAxisCount: 4,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        var book = snapshot.data![index];

        return Book(
          title: book.title,
          author: book.author,
          publisher: book.publisher,
          description: book.description,
          link: book.link,
          image: book.image,
          isbn: book.isbn,
        );
      },
      itemCount: snapshot.data!.length,
    );
  }
}
