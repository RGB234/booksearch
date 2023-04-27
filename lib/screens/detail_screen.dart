import 'package:booksearch/api/books_api.dart';
import 'package:booksearch/models/book_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title, author, publisher, description, link, image, isbn;

  const DetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.publisher,
    required this.description,
    required this.link,
    required this.image,
    required this.isbn,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<List<BookModel>> bookInfo;

  @override
  void initState() {
    super.initState();
    bookInfo = Books_Api.getSearchResults(widget.isbn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 800,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title, author, publisher, description, link, image, isbn;
                      Hero(
                        tag: widget.isbn,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                          width: 300,
                          child: Image.network(widget.image),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "작가: ${widget.author}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "출판사 : ${widget.publisher}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ISBN: ${widget.isbn}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.link,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
