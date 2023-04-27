import 'package:booksearch/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String title, author, publisher, description, link, image, isbn;

  const Book({
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              author: author,
              publisher: publisher,
              description: description,
              link: link,
              image: image,
              isbn: isbn,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          // 화면이동시 이미지에(만) 효과
          Hero(
            tag: isbn,
            child: Container(
              width: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    // offset -> shadow positioning
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(image),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ]),
      ),
    );
  }
}
