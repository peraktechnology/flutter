class BookDetail {
  final String title;
  final String subtitle;
  final String isbn10;
  final String isbn13;
  final String price;
  final String authors;
  final String publisher;
  final String pages;
  final String year;
  final String rating;
  final String image;
  final String url;
  final String desc;
  final Map<String, String>? pdf;

  BookDetail({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.isbn10,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.authors,
    required this.pdf,
    required this.publisher,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BookDetail.fromMap(Map<String, dynamic> map) {
    return BookDetail(
      title: map['title'],
      subtitle: map['subtitle'],
      isbn13: map['isbn13'],
      price: map['price'],
      image: map['image'],
      url: map['url'],
      authors: map['authors'],
      pages: map['pages'],
      rating: map['rating'],
      desc: map['desc'],
      pdf: map['pdf'],
      publisher: map['publisher'],
      isbn10: map['isbn10'],
      year: map['year'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isbn13': isbn13,
      'price': price,
      'image': image,
      'url': url,
      'year': year,
      'publisher': publisher,
      'authors': authors,
      'isbn10': isbn10,
      'pdf': pdf,
      'pages': pages,
      'rating': rating,
      'desc': desc,
    };
  }
}
