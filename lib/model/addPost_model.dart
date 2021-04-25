class AddPostModel {
  String petName;
  String category;
  String gender;
  String breed;
  String age;
  String color;
  String weight;
  String petStory;

  AddPostModel(
      {this.petName,
      this.category = 'cat',
      this.gender = 'male',
      this.breed,
      this.age,
      this.color,
      this.weight,
      this.petStory});
}
