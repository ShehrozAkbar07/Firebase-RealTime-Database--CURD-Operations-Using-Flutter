import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location_helper.dart';

class viewChild extends StatefulWidget {
  viewChild({
    super.key,
  });

  @override
  State<viewChild> createState() => _viewChildState();
}

class _viewChildState extends State<viewChild> {
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(27.7089427, 85.3086209);
  //location to show in map
  static Position? position;
  Completer<GoogleMapController> _mapcontroller = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.altitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  bool tappedYes = false;

  Future<void> getMyCurrentLocation() async {
    await Location_Helper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    //Child Info

    //Responsiviness variables
    final double ScreenHeight = MediaQuery.of(context).size.height;
    final double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28)),
          color: Colors.yellow,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: ScreenHeight * 0.53,
              width: MediaQuery.of(context).size.width,
              child: position != null
                  ? buildMap()
                  : Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 150.0),
                            child: Container(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                "من فضلك فعّل الموقع لكي تظهر الخريطة",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 33,
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: (() {
                                  // Navigator.push(
                                  //   context,
                                  //   // MaterialPageRoute(
                                  //   //     builder: (context) => editChild(
                                  //   //         childID: widget.childID,
                                  //   //         childImage: childImage,
                                  //   //         childname: childName,
                                  //   //         childbirthday: widget.childbirthday,
                                  //   //         childHeight: childHeight,
                                  //   //         childGender: childGender)),
                                  // );
                                }))
                          ],
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                " في منطقة",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 22,
                                  offset: Offset(5, 5),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenHeight * 0.01),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Directionality(
                    //       textDirection: TextDirection.rtl,
                    //       child: getAgeText(),
                    //     ),
                    //     Directionality(
                    //       textDirection: TextDirection.rtl,
                    //       child: Text(
                    //         "$childGender",
                    //         textDirection: TextDirection.rtl,
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //     Directionality(
                    //       textDirection: TextDirection.rtl,
                    //       child: Text(
                    //         "$childHeight سم",
                    //         textDirection: TextDirection.rtl,
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: ScreenHeight * 0.03),
                    // Directionality(
                    //   textDirection: TextDirection.rtl,
                    //   child: ElevatedButton.icon(
                    //     icon: Icon(
                    //       Icons.campaign,
                    //       color: Color(0xFF9C0000),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       textStyle: TextStyle(fontSize: 22),
                    //       shadowColor: Color.fromARGB(255, 0, 0, 0),
                    //       elevation: 0,
                    //       backgroundColor: Color(0xFFFFEEEE),
                    //       shape: const StadiumBorder(),
                    //       maximumSize: const Size(180, 48),
                    //       minimumSize: const Size(180, 48),
                    //     ),
                    //     label: loading == true
                    //         ? CircularProgressIndicator(
                    //             color: Color(0xFF9C0000),
                    //           )
                    //         : Text(
                    //             ' إنشاء بلاغ   ',
                    //             style: TextStyle(
                    //                 color: Color(0xFF9C0000), fontSize: 20),
                    //           ),
                    //     // onPressed: () async {
                    //     //   final action = await AlertDialogs.yesCancelDialog(
                    //     //       context,
                    //     //       'إلغاء البلاغ',
                    //     //       'هل أنت متأكد من إلغاء البلاغ؟');
                    //     //   if (!mounted) return;
                    //     //   if (action == DialogsAction.yes) {
                    //     //     setState(() => tappedYes = true);
                    //     //     if (!mounted) return;

                    //     //     Navigator.pop(context);
                    //     //   } else {
                    //     //     setState(() => tappedYes = false);
                    //     //     if (!mounted) return;
                    //     //   }
                    //     //   print("hello");
                    //     //   setState(() {
                    //     //     loading = true;
                    //     //   });

                    //     //   createReportToFirebase(widget.childID).then((value) {
                    //     //     setState(() {
                    //     //       loading = false;
                    //     //     });

                    //     //     // Fluttertoast.showToast(
                    //     //     //     msg: "Report Sucessfully",
                    //     //     //     toastLength: Toast.LENGTH_SHORT,
                    //     //     //     gravity: ToastGravity.BOTTOM,
                    //     //     //     timeInSecForIosWeb: 1,
                    //     //     //     backgroundColor:
                    //     //     //         Color.fromARGB(255, 48, 109, 50),
                    //     //     //     textColor: Colors.white,
                    //     //     //     fontSize: 16.0);
                    //     //     // Navigator.pushReplacement(
                    //     //     //     context,
                    //     //     //     MaterialPageRoute(
                    //     //     //         builder: ((context) => NavPage())));
                    //     //   });
                    //     // },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getAgeText() {
  //   //Convert timestamp type of data to DateTime
  //   DateTime childBirthday = DateTime.parse((widget.childbirthday).toString());
  //   //Calculate Age As years: 0, Months: 0, Days: 0
  //   // DateDuration calcAge = AgeCalculator.age(childBirthday);

  //   int childAgeYears = calcAge.years;
  //   int childAgeMonths = calcAge.months;
  //   String str = '';
  //   try {
  //     if (childAgeYears > 10 || childAgeYears == 1 || childAgeYears == 2) {
  //       str = "$childAgeYears سنة";
  //     } else if (childAgeYears > 2 && childAgeYears < 11) {
  //       str = "$childAgeYears سنوات";
  //     } else if (childAgeYears < 1) {
  //       if (childAgeMonths == 1 ||
  //           childAgeMonths == 11 ||
  //           childAgeMonths == 12 ||
  //           childAgeMonths == 0) {
  //         str = "$childAgeMonths شهر";
  //       } else {
  //         str = "$childAgeMonths شهور";
  //       }
  //     }
  //   } catch (error) {
  //     Text("error");
  //   }
  //   return Text(str,
  //       style: TextStyle(
  //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));
  // }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapcontroller.complete(controller);
      },
    );
  }

  // Future<String> createReportToFirebase(String childrenId) async {
  //   try {
  //     final docChild = FirebaseFirestore.instance.collection('report').doc();
  //     User? user = _auth.currentUser;
  //     final parentChild = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user!.uid)
  //         .collection('children')
  //         .doc(childrenId);

  //     Report report = Report();
  //     report.parentID = user.uid;
  //     report.id = docChild.id;
  //     report.status = "Missing";
  //     report.childrenId = childrenId;
  //     report.imageUrl = widget.childImage;

  //     report.childName = widget.childname;

  //     docChild.set(report.toMap());

  //     parentChild.update({"status": true});
  //     return "Succes";
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}

networkImg(String childImage, double ScreenWidth, double ScreenHeight) {
  try {
    return Image.network(
      childImage,
      width: ScreenWidth * 0.33,
      height: ScreenHeight * 0.15,
      fit: BoxFit.cover,
      frameBuilder:
          (BuildContext context, Widget child, int? frame, bool isAsyncLoaded) {
        return Padding(
          padding: EdgeInsets.all(1),
          child: child,
        );
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: Text(
            "جاري التحميل",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? st) {
        return Container(
          width: ScreenWidth * 0.33,
          height: ScreenHeight * 0.15,
          child: Center(
            child: Text(
              "حدث خطأ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  } catch (error) {}
}
