import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validus_coin/res/app_colors.dart';
import 'package:validus_coin/res/shared_preference.dart';
import 'package:validus_coin/res/strings.dart';

class EditProfileScreen extends StatefulWidget {
  final String type;
  final TextEditingController controller;

  const EditProfileScreen(this.type, this.controller, {Key key})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String name, email, address, type;
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<NavigatorState> _yourKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _backPressed(_yourKey),
      child: Container(
        color: Color(appColors.appBackGroundColor),
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                            onTap: () {
                              retainValues();
                              Navigator.pop(context);
                            },
                            child:
                                Image.asset("assets/images/cancel_icon.png")),
                      ),
                      Center(
                        child: Text(
                          AppStrings.profile,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppStrings.emailMsg,
                    style: const TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
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
                        controller: widget.controller,
                        style: TextStyle(color: Color(appColors.editGrey)),
                        validator: (text) {
                          return text.isEmpty
                              ? '${type} cannot be empty'
                              : type == "Email" && !validateEmail(text)
                                  ? 'Please enter valid email'
                                  : null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          counterText: "",
                          hintText: "Enter $type",
                          labelText: type,
                          labelStyle:
                              TextStyle(color: Color(appColors.editGrey)),
                          hintStyle:
                              TextStyle(color: Color(appColors.editGrey)),
                          contentPadding: const EdgeInsets.only(
                              bottom: 15.0, top: 15.0, left: 10),
                          errorStyle: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                          )),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                          )),
                        ),
                        onFieldSubmitted: (term) {
                          FocusScope.of(context).unfocus();
                        },
                        maxLength: 40,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      if (type == "Name") {
                        appPreferences.saveStringPreference(
                            "name", widget.controller.text.toString().trim());
                      } else if (type == "Email") {
                        appPreferences.saveStringPreference(
                            "email", widget.controller.text.toString().trim());
                      } else {
                        appPreferences.saveStringPreference("address",
                            widget.controller.text.toString().trim());
                      }
                      setState(() {

                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(appColors.yellowColor),
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
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      AppStrings.save,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _backPressed(GlobalKey<NavigatorState> _yourKey) async {
//if nothing remains in the stack, it simply pops
    retainValues();
    return Future<bool>.value(true);
  }

  Future<void> retainValues() async {
    final _name = await appPreferences.getStringPreference("name");
    final _email = await appPreferences.getStringPreference("email");
    final _address = await appPreferences.getStringPreference("address");

    if(type=="Email"){
      widget.controller.text=_email;
    }
    else if(type=="Name"){
      widget.controller.text=_name;
    }
    else{
      widget.controller.text=_address;
    }
    print("yessss");
    setState(() {

    });
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
