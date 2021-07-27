import 'package:pocket_reader/models/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();

  categoryModel.category = "Entertainment";
  categoryModel.imageurl =
      "https://betravingknows.com/wp-content/uploads/2018/09/160101_article_casino-entertainment-program_HOUSTON_entertainment.jpg";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Sports";
  categoryModel.imageurl =
      "https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190756?k=6&m=949190756&s=612x612&w=0&h=dNek5l5xc68G0gCZv-fe0vHP8kjDpAYFrRnSPh8iLyc=";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Health";
  categoryModel.imageurl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZrAf1Yfdj--EQPorW7wZKtjRzltXR98yNSQ&usqp=CAU";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Science";
  categoryModel.imageurl =
      "https://res.cloudinary.com/people-matters/image/upload/q_auto,f_auto/v1578710070/1578710068.jpg";
  categories.add(categoryModel);

  return categories;
}
