import 'package:flutter/material.dart';
import 'package:validus_coin/res/app_colors.dart';
import 'package:validus_coin/res/shared_preference.dart';
import 'package:validus_coin/res/strings.dart';

import 'edit_screen.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValues();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(appColors.appBackGroundColor),
      child: Container(
        margin: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children:[
                  const SizedBox(height: 10,),
                   Text(
                    AppStrings.profile,
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color:Colors.white
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0,bottom: 10),
                    decoration: BoxDecoration(
                      color: Color(appColors.cardColor),
                      shape: BoxShape.rectangle,
                      boxShadow:  [
                        BoxShadow(
                          color: Color(appColors.cardColor),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: const Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.name,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                editBottomSheet("Name",nameController);
                              },
                              child: Text(
                                AppStrings.edit,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Color(appColors.cardColor),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(appColors.cardColor),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: const Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: TextFormField(
                            controller: nameController,
                            enabled: false,
                            style: TextStyle(color: Color(appColors.editGrey)),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLength: 40,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.email,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                editBottomSheet("Email",emailController);
                              },
                              child: Text(
                                AppStrings.edit,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Color(appColors.cardColor),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(appColors.cardColor),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: const Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: TextFormField(
                            controller: emailController,
                            enabled: false,
                            style: TextStyle(color: Color(appColors.editGrey)),
                            decoration: const InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                            ),
                            maxLength: 40,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.address,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                editBottomSheet("Address",addressController);
                              },
                              child: Text(
                                AppStrings.edit,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Color(appColors.cardColor),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(appColors.cardColor),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: const Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: TextFormField(
                            controller: addressController,
                            style: TextStyle(color: Color(appColors.editGrey)),
                            enabled: false,
                            decoration: const InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                            ),
                            maxLength: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> editBottomSheet(String type,TextEditingController controller) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 7),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: EditProfileScreen(type,controller));
        });
  }

  Future<void> getValues() async {
    final _name = await appPreferences.getStringPreference("name");
    final _email = await appPreferences.getStringPreference("email");
    final _address = await appPreferences.getStringPreference("address");
    nameController.text=_name;
    emailController.text=_email;
    addressController.text=_address;
    setState(() {
    });
  }

}