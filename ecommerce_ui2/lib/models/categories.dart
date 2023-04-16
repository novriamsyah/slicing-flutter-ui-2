class Category {
  final int id;
  final String category;
  final String imgUrl;

  Category({
    required this.id,
    required this.category,
    required this.imgUrl,
  });

  static List<Category> categories = [
    Category(id: 0, category: 'MEN', imgUrl: 'assets/images/shoes1.png'),
    Category(id: 1, category: 'WOMEN', imgUrl: 'assets/images/shoes2.png'),
    Category(id: 2, category: 'CUSTOM', imgUrl: 'assets/images/shoes3.png'),
    Category(id: 3, category: 'KIDS', imgUrl: 'assets/images/shoes4.png'),
    Category(id: 4, category: 'CASUAL', imgUrl: 'assets/images/shoes5.png'),
  ];
}
