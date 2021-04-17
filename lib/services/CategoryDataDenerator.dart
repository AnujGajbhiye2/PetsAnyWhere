import 'package:paw/model/category_,model.dart';

List<CategoryModel> getData() {
  List<CategoryModel> list = List<CategoryModel>();

  CategoryModel model1 = CategoryModel();
  model1.name = "Dogs";
  model1.position = 0;
  model1.Image = "assets/dogIcon.png";

  CategoryModel model2 = CategoryModel();
  model2.name = "Cats";
  model2.position = 1;
  model2.Image = "assets/catIcon.png";

  CategoryModel model3 = CategoryModel();
  model3.name = "Bunnies";
  model3.position = 2;
  model3.Image = "assets/bunnyIcon.png";

  CategoryModel model4 = CategoryModel();
  model4.name = "Birds";
  model4.position = 3;
  model4.Image = "assets/birdIcon.png";

  CategoryModel model5 = CategoryModel();
  model5.name = "Fishes";
  model5.position = 4;
  model5.Image = "assets/fishIcon.png";

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}
