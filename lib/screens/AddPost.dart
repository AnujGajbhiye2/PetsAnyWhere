import 'package:flutter/material.dart';
import 'package:paw/components/CustomDropDown.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/dropdown_model.dart';
import 'package:paw/utilities/utilities.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final List<CategoryDropDownModel> _categoryDropDownModelList = [
    CategoryDropDownModel(category: 'Pudding'),
    CategoryDropDownModel(category: 'Frozen Yogurt'),
    CategoryDropDownModel(category: 'Chocolate Milk'),
  ];
  CategoryDropDownModel _categoryDropDownModel = CategoryDropDownModel();
  List<DropdownMenuItem<CategoryDropDownModel>>
      _categoryDropDownModelDropdownList;
  List<DropdownMenuItem<CategoryDropDownModel>>
      _buildCategoryDropDownModelDropdown(List CategoryDropDownModelList) {
    List<DropdownMenuItem<CategoryDropDownModel>> items = List();
    for (CategoryDropDownModel CategoryDropDownModel
        in CategoryDropDownModelList) {
      items.add(DropdownMenuItem(
        value: CategoryDropDownModel,
        child: Text(CategoryDropDownModel.category),
      ));
    }
    return items;
  }

  _onChangeFavouriteFoodModelDropdown(
      CategoryDropDownModel favouriteFoodModel) {
    setState(() {
      _categoryDropDownModel = favouriteFoodModel;
    });
  }

  @override
  void initState() {
    _categoryDropDownModelDropdownList =
        _buildCategoryDropDownModelDropdown(_categoryDropDownModelList);
    _categoryDropDownModel = _categoryDropDownModelList[0];
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
              CustomDropDown(
                // dropdownMenuItemList: _categoryDropDownModelDropdownList,
                // onChanged: _onChangeFavouriteFoodModelDropdown,
                // value: _categoryDropDownModel,
                isEnabled: true,
              ),
              CustomTextField(fieldName: 'Sex'),
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
                      width: size.width / 3,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                fieldName: 'pet Story',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
