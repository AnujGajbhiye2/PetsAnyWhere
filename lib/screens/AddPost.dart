import 'dart:convert';
import 'dart:developer';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/environment/Strings.dart' as env;
import 'package:flutter/material.dart';
import 'package:paw/components/AppButton.dart';
import 'package:paw/components/CustomDropDown.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/components/TopAppBar.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/addPost_model.dart';
import 'package:paw/model/dropdown_model.dart';
import 'package:paw/model/gender_model.dart';
import 'package:paw/services/Globals.dart';
import 'package:paw/utilities/loader.dart';
import 'package:paw/utilities/utilities.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  AddPostModel form = AddPostModel();
  final _formKey = GlobalKey<FormState>();

  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  final cloudinary = CloudinaryPublic('paw', 'paw_preset', cache: false);

  final List<CategoryDropDownModel> _categoryDropDownModelList = [
    CategoryDropDownModel(id: 'cat', categoryName: 'Cat'),
    CategoryDropDownModel(id: 'dog', categoryName: 'Dog'),
    CategoryDropDownModel(id: 'fish', categoryName: 'Fish'),
    CategoryDropDownModel(id: 'bunny', categoryName: 'Bunny'),
  ];
  final List<GenderModel> _genderList = [
    GenderModel(gender: 'Male'),
    GenderModel(gender: 'Female')
  ];

  CategoryDropDownModel _categoryDropDownModel = CategoryDropDownModel();
  GenderModel _genderModel = GenderModel();

  List<DropdownMenuItem<CategoryDropDownModel>>
      _categoryDropDownModelDropdownList;
  List<DropdownMenuItem<GenderModel>> _genderModelDropdownList;

  List<DropdownMenuItem<CategoryDropDownModel>>
      _buildCategoryDropDownModelDropdown(List categoryDropDownModelList) {
    List<DropdownMenuItem<CategoryDropDownModel>> items = List();
    for (CategoryDropDownModel categoryDropDownModel
        in categoryDropDownModelList) {
      items.add(DropdownMenuItem(
        value: categoryDropDownModel,
        child: Text(categoryDropDownModel.categoryName),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<GenderModel>> _buildGenderDropDown(
      List genderDropdownList) {
    List<DropdownMenuItem<GenderModel>> items = List();

    for (GenderModel genderModel in genderDropdownList) {
      items.add(DropdownMenuItem(
          value: genderModel, child: Text(genderModel.gender)));
    }
    return items;
  }

  _onChangeCategoryModelDropdown(CategoryDropDownModel category) {
    setState(() {
      _categoryDropDownModel = category;
      form.category = category.id;
    });
  }

  _onChangeGenderDropDown(GenderModel gender) {
    setState(() {
      _genderModel = gender;
      form.gender = gender.gender;
    });
  }

  @override
  void initState() {
    _categoryDropDownModelDropdownList =
        _buildCategoryDropDownModelDropdown(_categoryDropDownModelList);
    _categoryDropDownModel = _categoryDropDownModelList[0];

    _genderModelDropdownList = _buildGenderDropDown(_genderList);
    _genderModel = _genderList[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customText('Add Post',
                            isCentered: true,
                            textColor: kBlack,
                            fontFamily: kFontBold,
                            fontSize: kTextSizeLarge),
                        Image.asset(
                          'assets/pet-group.png',
                          height: size.height / 5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      fieldName: 'Pet Name',
                      onChange: (value) {
                        form.petName = value;
                      },
                      controllerText: TextEditingController(text: form.petName),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'your pet must be having a name 😸';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomDropdown(
                      dropdownMenuItemList: _categoryDropDownModelDropdownList,
                      onChanged: _onChangeCategoryModelDropdown,
                      value: _categoryDropDownModel,
                      isEnabled: true,
                    ),
                    CustomDropdown(
                      dropdownMenuItemList: _genderModelDropdownList,
                      onChanged: _onChangeGenderDropDown,
                      value: _genderModel,
                      isEnabled: true,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomTextField(
                              fieldName: 'Breed',
                              width: size.width / 2.5,
                              onChange: (value) {
                                form.breed = value;
                              },
                              controllerText:
                                  TextEditingController(text: form.breed),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'breed is required 🦔';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          CustomTextField(
                            fieldName: 'year old',
                            width: size.width / 3,
                            keyboardType: 'number',
                            onChange: (value) {
                              form.age = value;
                            },
                            controllerText:
                                TextEditingController(text: form.age),
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'age is required 🐥';
                              } else if (int.parse(value) < 0) {
                                return 'invalid age';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomTextField(
                              fieldName: 'color',
                              width: size.width / 2.5,
                              onChange: (value) {
                                form.color = value;
                              },
                              controllerText:
                                  TextEditingController(text: form.color),
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'color of your pet is required 🐦';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          CustomTextField(
                            fieldName: 'weight',
                            keyboardType: 'number',
                            width: size.width / 3,
                            onChange: (value) {
                              form.weight = value;
                            },
                            controllerText:
                                TextEditingController(text: form.weight),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      fieldName: 'Tell us your pet story',
                      isMultiLine: true,
                      onChange: (value) {
                        form.petStory = value;
                      },
                      controllerText:
                          TextEditingController(text: form.petStory),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'tell us why you want to put your pet for adoption 😿';
                        } else if (value.length < 100) {
                          return 'please describe a little more 🙊';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          ButtonTheme(
                            height: 50,
                            minWidth: 50,
                            child: FlatButton(
                              color: Colors.grey[400],
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                loadAssets();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          displayImages()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding * 1.2),
                      child: AppButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, 'messages');
                          if (_formKey.currentState.validate()) {
                            //truthy
                            submitForm();
                            // inspect(g_userId);
                          } else {
                            //falsy
                          }
                        },
                        textContent: "Set up Adoption",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          TopAppBar('')
        ],
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No error detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      );
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Widget displayImages() {
    if (images.length > 0) {
      return Row(
        children: [
          imageThumbnail(0),
          images.length == 2
              ? imageThumbnail(1)
              : SizedBox(
                  height: 1,
                ),
          images.length == 3
              ? imageThumbnail(2)
              : SizedBox(
                  height: 1,
                ),
          images.length == 4
              ? imageThumbnail(3)
              : SizedBox(
                  height: 1,
                ),
        ],
      );
    } else {
      return Text('Upload your \n pet Images');
    }
  }

  Padding imageThumbnail(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Container(
            child: AssetThumb(
              asset: images[index],
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Stack(
          children: [
            AssetThumb(
              asset: asset,
              width: 30,
              height: 30,
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
              ),
            )
          ],
        );
      }),
    );
  }

  Future uploadImage() async {
    List<CloudinaryResponse> uploaddedImages = await cloudinary.multiUpload(
      images
          .map(
            (image) => CloudinaryFile.fromFutureByteData(image.getByteData(),
                identifier: image.identifier),
          )
          .toList(),
    );

    print(uploaddedImages);
  }

  Future submitForm() async {
    try {
      LoadingOverlay.of(context).show();
      final response = await http.post(env.addPost, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'userId': g_userId,
        'age': form.age,
        'breed': form.breed,
        'category': form.category,
        'color': form.color,
        'gender': form.gender,
        'petName': form.petName,
        'petStory': form.petStory,
        'weight': form.weight
      }).catchError((onError) => toast(onError.toString()));

      Map<String, dynamic> responseJSON = json.decode(response.body);
      if (responseJSON['success']) {
        toast('Adoption added successfully 🐤');
        LoadingOverlay.of(context).hide();
      } else {
        toast(responseJSON['errMessage']);
        LoadingOverlay.of(context).hide();
      }
    } catch (e) {
      inspect(e);
    }
  }
}
