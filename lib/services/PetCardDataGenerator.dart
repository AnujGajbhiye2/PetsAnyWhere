import 'package:paw/constants.dart';
import 'package:paw/model/petInfo_model.dart';

List<PetCardModel> getPetListData() {
  var list = new List<PetCardModel>();
  var model1 = PetCardModel();
  model1.name = "Logan";
  model1.breed = "Labrador";
  model1.image = doggoImg;
  model1.yearsOld = "3 years old";
  model1.location = "Nagpur, Maharashtra";

  var model2 = PetCardModel();
  model2.name = "Thanos";
  model2.breed = "German Shepard";
  model2.image = doggoImg;
  model2.yearsOld = "5 years old";
  model2.location = "Mumbai, Maharashtra";

  list.add(model1);
  list.add(model2);
  return list;
}
