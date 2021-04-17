import 'package:flutter/material.dart';
import 'package:paw/components/AppButton.dart';
import 'package:paw/components/CustomDropDown.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/dropdown_model.dart';
import 'package:paw/model/gender_model.dart';
import 'package:paw/utilities/utilities.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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
    });
  }

  _onChangeGenderDropDown(GenderModel gender) {
    setState(() {
      _genderModel = gender;
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
      body: SingleChildScrollView(
        child: SafeArea(
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
              CustomTextField(fieldName: 'Pet Name'),
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
                      ),
                    ),
                    CustomTextField(
                      fieldName: 'year old',
                      width: size.width / 3,
                      isDigit: true,
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
                      ),
                    ),
                    CustomTextField(
                      fieldName: 'weight',
                      isDigit: true,
                      width: size.width / 3,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                fieldName: 'Tell us your pet story',
                isMultiLine: true,
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 1.2),
                child: AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'messages');
                  },
                  textContent: "Set up Adoption",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
