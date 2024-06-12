// Map<String, dynamic> : BookModel in List<Map<String, dynamic>>
class BookModel {
  final String title, author, publisher, description, link, image, isbn;

  // named constructor
  BookModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        publisher = json["publisher"],
        description = json["description"],
        link = json["link"],
        image = json["image"],
        isbn = json["isbn"];
}
