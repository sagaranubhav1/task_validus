// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:validus_coin/ui/home_page.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   DashboardPageState createState() => DashboardPageState();
// }
//
// class DashboardPageState extends State<DashboardPage> {
//   String screenTitle = "";
//
//   bool rightIconOneBool = true,
//       rightIconTwoBool = true,
//       showAppBar = false,
//       moreScreenBool = false;
//
//   GlobalKey _bottomNavigationKey = GlobalKey();
//
//   GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   Widget _currentScreen = HomePage();
//
//   var documentStatus, dob,userAge;
//
//   @override
//   void initState() {
//     super.initState();
//     _asyncMethod();
//     if(userAge==null){
//       userAge=0;
//     }
//   }
//
//   _asyncMethod() async {
//     dob = await appPreferences.getStringPreference("UserDOB");
//     documentStatus = await appPreferences.getStringPreference("DocumentStatus");
//     print("documentStatusPrint========" + documentStatus.toString());
//     print("dobPrint========" + dob.toString());
//
//     DateTime parseDate = new DateFormat("dd/MM/yyyy").parse(dob);
//     print("userAgePrint========" + parseDate.toString());
//
//     var inputDate = DateTime.parse(parseDate.toString());
//     userAge = calculateAge(inputDate);
//     print("userAgePrint========" + userAge.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     screenTitle = AppLocalizations.of(context).translate("Home");
//
//     List<String> homeMenuTitle = [
//       AppLocalizations.of(context).translate("Profile"),
//       AppLocalizations.of(context).translate("Wedding Booking"),
//       AppLocalizations.of(context).translate("Wedding Invite"),
//       AppLocalizations.of(context).translate("Child Registration"),
//       AppLocalizations.of(context).translate("Participate In Survey"),
//       AppLocalizations.of(context).translate("Vote"),
//     ];
//     return Scaffold(
//       backgroundColor: Color(appColors.buttonColor),
//       key: scaffoldKey,
//       // drawer: navigationDrawer(),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CurvedNavigationBar(
//             key: _bottomNavigationKey,
//             index: 0,
//             height: 50.0,
//             items: <Widget>[
//               SvgPicture.asset(
//                 "assets/images/home_icon.svg",
//                 fit: BoxFit.cover,
//                 width: 30,
//                 height: 30,
//               ),
//               SvgPicture.asset(
//                 "assets/images/donation.svg",
//                 fit: BoxFit.cover,
//                 width: 40,
//                 height: 40,
//               ),
//               SvgPicture.asset(
//                 "assets/images/calender.svg",
//                 fit: BoxFit.cover,
//                 width: 40,
//                 height: 40,
//               ),
//               SvgPicture.asset(
//                 "assets/images/service_icon.svg",
//                 fit: BoxFit.cover,
//                 width: 40,
//                 height: 40,
//               ),
//               !moreScreenBool?SvgPicture.asset(
//                 "assets/images/more_icon.svg",
//                 fit: BoxFit.cover,
//                 width: 40,
//                 height: 40,
//               ):Icon(Icons.cancel_outlined,color: Colors.white,),
//               // SvgPicture.asset(
//               //   "assets/images/more_icon.svg",
//               //   fit: BoxFit.cover,
//               //   width: 40,
//               //   height: 40,
//               // )
//             ],
//             color: Color(appColors.buttonColor),
//             buttonBackgroundColor: Color(appColors.buttonColor),
//             backgroundColor: Color(appColors.blue),
//             animationCurve: Curves.easeInOut,
//             animationDuration: Duration(milliseconds: 600),
//             onTap: (index) {
//               if (index == 4) {
//                 onSelectBottomMenu(4);
//               } else if (index == 3) {
//                 onSelectBottomMenu(3);
//               } else if (index == 0) {
//                 onSelectBottomMenu(0);
//               } else if (index == 1) {
//                 onSelectBottomMenu(1);
//               } else if (index == 2) {
//                 onSelectBottomMenu(2);
//               }
//             },
//             letIndexChange: (index) => true,
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 15),
//             color: Color(appColors.buttonColor),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 10),
//                   child: Label(
//                     title: AppLocalizations.of(context).translate("Home"),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 5),
//                   child: Label(
//                     title: AppLocalizations.of(context).translate("Donation"),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   child: Label(
//                     title: AppLocalizations.of(context).translate("Calendar"),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 15),
//                   child: Label(
//                     title: AppLocalizations.of(context).translate("Service"),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 10),
//                   child: Label(
//                     title: AppLocalizations.of(context).translate("More"),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/bg_image.jpg"),
//               fit: BoxFit.fill,
//             ),
//           ),
//           padding: EdgeInsets.only(top: 20),
//           child: Stack(
//             children: [
//               /* showAppBar?Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/bg_image.jpg"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 padding: EdgeInsets.only(
//                   left: 7,
//                   right: 5,
//                   bottom: 10,
//                   top: 10,
//                 ),
//                 alignment: Alignment.center,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     BlocListener<UserBloc, UserState>(
//                       listenWhen: (oldState, newSate) {
//                         return oldState.logoutResource == null ||
//                             oldState.logoutResource.status !=
//                                 newSate.logoutResource.status;
//                       },
//                       listener: (context, state) {
//                         if (state.logoutResource != null &&
//                             state.logoutResource.status == STATUS.ERROR) {
//                           Navigator.of(context).pop();
//                           showSnackBarMessage(
//                               context: context,
//                               message:
//                                   state.logoutResource.failure.message);
//                         } else if (state.logoutResource!=null && state.logoutResource.status ==
//                             STATUS.SUCCESS) {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginPage(),
//                             ),
//                           );
//                         }
//                       },
//                       child: BlocBuilder<UserBloc, UserState>(
//                         buildWhen: (oldState, newState) {
//                           return oldState.logoutResource == null ||
//                               oldState.logoutResource.status !=
//                                   newState.logoutResource.status;
//                         },
//                         builder: (context, state) {
//                           if (state.logoutResource != null &&
//                               state.logoutResource.status ==
//                                   STATUS.LOADING) {
//                             return circularProgressIndicator();
//                           }
//                           return GestureDetector(
//                             onTap: () {
//                               print('logout called');
//                               try {
//                                 BlocProvider.of<UserBloc>(context)
//                                     .add(LogoutEvent());
//                               } catch (ex) {
//                                 print('logout exception $ex');
//                               }
//                             },
//                             child: SvgPicture.asset(
//                               "assets/images/logout_icon.svg",
//                               fit: BoxFit.cover,
//                               width: 40,
//                               height: 40,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20),
//                         child: Label(
//                             title: screenTitle,
//                             fontSize: 20,
//                             color: Colors.white,
//                             textAlign: TextAlign.center),
//                       ),
//                     ),
//                     actionIconsRight()
//                   ],
//                 ),
//               ):Container(),*/
//               Container(
//                   height: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: _currentScreen),
//               moreScreenBool
//                   ? Container(
//                 height: MediaQuery.of(context).size.height,
//                 decoration:
//                 BoxDecoration(color: Colors.white.withOpacity(0.8)),
//               )
//                   : Container(),
//               moreScreenBool
//                   ? Positioned(
//                 right: 20,
//                 bottom: 30,
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             CommonMethods().animatedNavigation(
//                                 context: context,
//                                 currentScreen: MoreScreen(),
//                                 landingScreen: ProfileScreen());
//                           },
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin:
//                                 EdgeInsets.only(left: 10, right: 10),
//                                 child: Label(
//                                   title: AppLocalizations.of(context).translate("Profile"),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(appColors.buttonColor),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                     color: Color(appColors.buttonColor),
//                                     borderRadius:
//                                     BorderRadius.circular(30)),
//                                 child: SvgPicture.asset(
//                                   "assets/images/profile_icon.svg",
//                                   fit: BoxFit.cover,
//                                   color: Colors.white,
//                                   width: 35,
//                                   height: 35,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             CommonMethods().animatedNavigation(
//                                 context: context,
//                                 currentScreen: MoreScreen(),
//                                 landingScreen: CommitteeManagement());
//                           },
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin:
//                                 EdgeInsets.only(left: 10, right: 10),
//                                 child: Label(
//                                   title: AppLocalizations.of(context).translate("Allawati Committee"),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(appColors.buttonColor),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                     color: Color(appColors.buttonColor),
//                                     borderRadius:
//                                     BorderRadius.circular(30)),
//                                 child: SvgPicture.asset(
//                                   "assets/images/commitee_icon.svg",
//                                   fit: BoxFit.cover,
//                                   color: Colors.white,
//                                   width: 35,
//                                   height: 35,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         userAge>20 && documentStatus=="2"?GestureDetector(
//                           onTap: () {
//                             CommonMethods().animatedNavigation(
//                                 context: context,
//                                 currentScreen: MoreScreen(),
//                                 landingScreen: ChildRegistration());
//                           },
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin:
//                                 EdgeInsets.only(left: 10, right: 10),
//                                 child: Label(
//                                   title: AppLocalizations.of(context).translate("Child Registration"),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(appColors.buttonColor),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                     color: Color(appColors.buttonColor),
//                                     borderRadius:
//                                     BorderRadius.circular(30)),
//                                 child: SvgPicture.asset(
//                                   "assets/images/child_enrollment.svg",
//                                   fit: BoxFit.cover,
//                                   color: Colors.white,
//                                   width: 35,
//                                   height: 35,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ):Container(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             CommonMethods().animatedNavigation(
//                                 context: context,
//                                 currentScreen: MoreScreen(),
//                                 landingScreen: SettingsScreen());
//                           },
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin:
//                                 EdgeInsets.only(left: 10, right: 10),
//                                 child: Label(
//                                   title: AppLocalizations.of(context).translate("Settings"),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(appColors.buttonColor),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                     color: Color(appColors.buttonColor),
//                                     borderRadius:
//                                     BorderRadius.circular(30)),
//                                 child: SvgPicture.asset(
//                                   "assets/images/setting_icon.svg",
//                                   fit: BoxFit.cover,
//                                   color: Colors.white,
//                                   width: 35,
//                                   height: 35,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         BlocListener<UserBloc, UserState>(
//                           listenWhen: (oldState, newSate) {
//                             return oldState.logoutResource == null ||
//                                 oldState.logoutResource.status !=
//                                     newSate.logoutResource.status;
//                           },
//                           listener: (context, state) {
//                             if (state.logoutResource != null &&
//                                 state.logoutResource.status ==
//                                     STATUS.ERROR) {
//                               Navigator.of(context).pop();
//                               showSnackBarMessage(
//                                   context: context,
//                                   message: state
//                                       .logoutResource.failure.message);
//                             } else if (state.logoutResource != null &&
//                                 state.logoutResource.status ==
//                                     STATUS.SUCCESS) {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginPage(),
//                                 ),
//                               );
//                             }
//                           },
//                           child: BlocBuilder<UserBloc, UserState>(
//                             buildWhen: (oldState, newState) {
//                               return oldState.logoutResource == null ||
//                                   oldState.logoutResource.status !=
//                                       newState.logoutResource.status;
//                             },
//                             builder: (context, state) {
//                               if (state.logoutResource != null &&
//                                   state.logoutResource.status ==
//                                       STATUS.LOADING) {
//                                 return circularProgressIndicator();
//                               }
//                               return GestureDetector(
//                                 onTap: () {
//                                   print('logout called');
//                                   try {
//                                     BlocProvider.of<UserBloc>(context)
//                                         .add(LogoutEvent());
//                                   } catch (ex) {
//                                     print('logout exception $ex');
//                                   }
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(
//                                           left: 10, right: 10),
//                                       child: Label(
//                                         title: AppLocalizations.of(context).translate("Log Out"),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color:
//                                         Color(appColors.buttonColor),
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.all(4),
//                                       decoration: BoxDecoration(
//                                           color: Color(
//                                               appColors.buttonColor),
//                                           borderRadius:
//                                           BorderRadius.circular(30)),
//                                       child: SvgPicture.asset(
//                                         "assets/images/new_log_out.svg",
//                                         fit: BoxFit.cover,
//                                         color: Colors.white,
//                                         width: 35,
//                                         height: 35,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//                   : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onSelectBottomMenu(int index) {
//     switch (index) {
//       case 0: //Home menu tiles
//         if (_currentScreen is! HomeScreen) {
//           screenTitle = "";
//           moreScreenBool = false;
//           setState(() {});
//           updateScreen(HomeScreen());
//         }
//         break;
//       case 1:
//         if (_currentScreen is! DonationScreen) {
//           screenTitle = "Donation";
//           updateScreen(DonationScreen());
//         }
//         break;
//       case 2:
//         if (_currentScreen is! CalendarPage) {
//           screenTitle = "Calendar";
//           updateScreen(CalendarPage());
//         }
//         break;
//       case 3:
//         if (_currentScreen is! ServicesScreen) {
//           screenTitle = "Services";
//           updateScreen(ServicesScreen());
//         }
//         break;
//       case 4:
//         if (_currentScreen is! MoreScreen) {
//           screenTitle = "More";
//           moreScreenBool = !moreScreenBool;
//           setState(() {});
//           // updateScreen(MoreScreen());
//         }
//         break;
//     }
//   }
//
//   void onSelectSideMenu(int index) {
//     if (scaffoldKey.currentState.isDrawerOpen) {
//       Navigator.pop(context);
//     }
//     switch (index) {
//       case 0: //Home menu tiles
//         if (_currentScreen is! ProfileScreen) {
//           CommonMethods().animatedNavigation(
//               context: context,
//               currentScreen: DashboardPage(),
//               landingScreen: ProfileScreen());
//         }
//         break;
//       case 1: //Home menu tiles
//         if (_currentScreen is! WeddingBooking) {
//           CommonMethods().animatedNavigation(
//               context: context,
//               currentScreen: DashboardPage(),
//               landingScreen: WeddingBooking());
//         }
//         break;
//       case 2:
//         if (_currentScreen is! WeddingInvite) {
//           CommonMethods().animatedNavigation(
//               context: context,
//               currentScreen: DashboardPage(),
//               landingScreen: WeddingInvite());
//         }
//         break;
//       case 3:
//       // if (_currentScreen is! ChildrenRegistration) {
//       //   CommonMethods().animatedNavigation(
//       //       context: context,
//       //       currentScreen: DashboardPage(),
//       //       landingScreen: ChildrenRegistration());
//       // }
//         break;
//       case 4:
//         if (_currentScreen is! SurveyMainPage) {
//           CommonMethods().animatedNavigation(
//               context: context,
//               currentScreen: DashboardPage(),
//               landingScreen: SurveyMainPage());
//         }
//         break;
//       case 5:
//         if (_currentScreen is! ElectionPage) {
//           CommonMethods().animatedNavigation(
//               context: context,
//               currentScreen: DashboardPage(),
//               landingScreen: ElectionPage());
//         }
//
//         break;
//     }
//   }
//
//   void updateScreen(Widget widget) {
//     _currentScreen = widget;
//     moreScreenBool = false;
//     setState(() {});
//   }
//
//   Widget menuListItem(int index) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 15, bottom: 15),
//             child: Label(
//               // title: homeMenuTitle[index],
//               fontSize: 16,
//             ),
//           ),
//           Divider(
//             thickness: 0.5,
//             color: Color(appColors.greyC2C2C2),
//           ),
//         ],
//       ),
//     );
//   }
//
//   actionIconsRight() {
//     return Row(
//       children: <Widget>[
//         _currentScreen is HomeScreen || _currentScreen is DonationScreen
//             ? Container(
//           padding: const EdgeInsets.all(5),
//           child: Row(
//             children: [
//               rightIconOneBool
//                   ? GestureDetector(
//                 onTap: () {
//                   handleNavigation();
//                 },
//                 child: Container(
//                   child: screenTitle == "Home"
//                       ? SvgPicture.asset(
//                     "assets/images/notification_icon.svg",
//                     width: 30,
//                     height: 30,
//                   )
//                       : SvgPicture.asset(
//                     "assets/images/donation_history.svg",
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),
//               )
//                   : Container(),
//               SizedBox(
//                 width: 15,
//               ),
//               rightIconTwoBool
//                   ? GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => InfoScreen()));
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(right: 10),
//                   child: SvgPicture.asset(
//                     "assets/images/info_icon.svg",
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),
//               )
//                   : Container(),
//             ],
//           ),
//         )
//             : Container(width: 38),
//       ],
//     );
//   }
//
//   void handleNavigation() {
//     if (screenTitle == "Home") {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => NotificationScreen()));
//     } else {
//       donationHistoryBottomSheet();
//     }
//   }
// }
