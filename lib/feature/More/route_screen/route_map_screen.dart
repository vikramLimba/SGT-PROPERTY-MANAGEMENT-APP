// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// import 'package:sgt_owner/style/colors.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:google_api_headers/google_api_headers.dart';

// class RouteMapWithCheckpointScreen extends StatefulWidget {
//   const RouteMapWithCheckpointScreen({super.key});

//   @override
//   State<RouteMapWithCheckpointScreen> createState() =>
//       _RouteMapWithCheckpointScreenState();
// }

// const kGoogleApiKey = 'AIzaSyC8ANlL0wwuYmR3Y64I6qqv6vpxbkdKdsM';
// final homeScaffoldKey = GlobalKey<ScaffoldState>();

// class _RouteMapWithCheckpointScreenState
//     extends State<RouteMapWithCheckpointScreen> {
//   late GoogleMapController googleMapController;
//   final Mode _mode = Mode.overlay;

//   Set<Marker> markersList = {};
//   Timer? _debounce;
//   LatLng? currentlocation;
//   String location = "Search Location";

//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }

//   void _addMarker(GoogleMapController controller, currentPosition) {
//     markersList.clear();
//     markersList.add(Marker(
//         markerId: const MarkerId("0"),
//         position: currentPosition,
//         infoWindow: InfoWindow(title: 'I am a marker')));
//     setState(() {});
//     currentlocation = currentPosition;
//     controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 14.0));
//   }

//   _onSearchChanged(String query) {
//     // debounce
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 1000), () {
//       print("------------query------------------> ${query}");
//     });
//   }

//   Future<void> _handlePressButton() async {
//     Prediction? p = await PlacesAutocomplete.show(
//         context: context,
//         apiKey: kGoogleApiKey,
//         onError: onError,
//         mode: _mode,
//         language: 'en',
//         strictbounds: false,
//         types: [""],
//         overlayBorderRadius: BorderRadius.circular(20),
//         hint: 'Search',
//         components: [Component(Component.country, "ind")]);

//     displayPrediction(p!, homeScaffoldKey.currentState);
//   }

//   void onError(PlacesAutocompleteResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       content: AwesomeSnackbarContent(
//         title: 'Message',
//         message: response.errorMessage!,
//         contentType: ContentType.failure,
//       ),
//     ));

//     // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
//   }

//   Future<void> displayPrediction(
//       Prediction p, ScaffoldState? currentState) async {
//     GoogleMapsPlaces places = GoogleMapsPlaces(
//         apiKey: kGoogleApiKey,
//         apiHeaders: await const GoogleApiHeaders().getHeaders());

//     PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;

//     print('------------------------------------------> ${detail.result}');

//     markersList.clear();
//     markersList.add(Marker(
//         markerId: const MarkerId("0"),
//         position: LatLng(lat, lng),
//         infoWindow: InfoWindow(title: detail.result.name),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
//     setState(() {});

//     googleMapController
//         .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
//     currentlocation = LatLng(lat, lng);
//   }

//   _handleTap(LatLng point) {
//     markersList.clear();
//     setState(() {
//       markersList.add(Marker(
//         markerId: MarkerId(point.toString()),
//         position: point,
//         // infoWindow: InfoWindow(
//         //   title: 'I am a marker',
//         // ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       ));
//       currentlocation = point;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // init Google Maps With ApiKey Shared by Suravi
//         // GoogleMap(
//         //   myLocationEnabled: true,
//         //   zoomGesturesEnabled: true,
//         //   initialCameraPosition:
//         //       CameraPosition(target: LatLng(29.396458, 76.413274), zoom: 14.0),
//         //   markers: markersList,
//         //   mapType: MapType.normal,
//         //   onMapCreated: (GoogleMapController controller) {
//         //     googleMapController = controller;
//         //   },
//         //   onTap: (x) => _handleTap(x),
//         // ),
//         GoogleMap(
//         polylines:_polyline,
//         markers: _markers,
//         onMapCreated: _onMapCreated,
//         myLocationEnabled:true,
//         onCameraMove: _onCameraMove,
//         initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//         ),

//         mapType: MapType.normal,

//     );
//         Positioned(
//           top:0,
//             child: InkWell(
//               onTap: _handlePressButton,
//               child: Container(
//                 width: Get.width,
//                 height: 80.h,
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   border: Border.all(color: Colors.grey),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(
//                         0,
//                         3,
//                       ), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child:Container(

//                 )
//               ),
//             )),
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RouteMapWithCheckpointScreen extends StatefulWidget {
  @override
  _RouteMapWithCheckpointScreenState createState() =>
      _RouteMapWithCheckpointScreenState();
}

class _RouteMapWithCheckpointScreenState
    extends State<RouteMapWithCheckpointScreen> {
  late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    // Define the polyline coordinates here
    polylineCoordinates.add(LatLng(37.42796133580664, -122.085749655962));
    polylineCoordinates.add(LatLng(37.42796133580664, -122.065749655962));
  }

  List<Map<dynamic, dynamic>> checkInData = [
    {'name': 'Radission BLue Hotel 1', 'status': 'Visited', 'time': ''},
    {'name': 'Radission BLue Hotel 1', 'status': 'Missed', 'time': ''},
    {'name': 'Radission BLue Hotel 1', 'status': 'Visited', 'time': ''},
    {
      'name': 'Radission BLue Hotel 1',
      'status': 'Check-in',
      'time': '10:00 AM'
    },
    {
      'name': 'Radission BLue Hotel 1',
      'status': 'Check-in',
      'time': '10:00 AM'
    },
    {'name': 'Radission BLue Hotel 1', 'status': 'Check-in', 'time': '10:00 AM'}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            width: Get.width,
            height: 80.h,
            // padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(
                    0,
                    3,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(
                  left: 16.w, right: 50.w, top: 8.h, bottom: 8.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                leading: Icon(
                  Icons.business_center,
                  size: 24.w,
                ),
                iconColor: AppColors.primaryColor,
                title: Text("Radission Blu Hotel",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.primaryColor, 14.sp)),
                subtitle: Text("Shift Name",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp)),
                trailing: Text("4:00 AM - 8:00 AM",
                    style: AppFontStyle.mediumTextStyle(
                        AppColors.textColor, 12.sp)),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              // markers: _markers,
              myLocationEnabled: true,
              // onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(26.8467, 80.9462),
                zoom: 5,
              ),
              polygons: <Polygon>{
                Polygon(
                    polygonId: const PolygonId('area'),
                    points: getPoints(),
                    geodesic: true,
                    strokeColor: AppColors.primaryColor,
                    strokeWidth: 5,
                    fillColor: AppColors.white.withOpacity(0.1),
                    visible: true),
              },
            ),
          ),
          InkWell(
            onTap: () {
              buildBottomSheet();
            },
            child: AppBottomSheet(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r))),
                height: 10.h,
              ),
            ),
          ),
        ],
      )),
    );
  }

  getPoints() {
    return const [
      LatLng(28.7041, 77.1025), // New Delhi
      // LatLng(19.0760, 72.8777), // Mumbai
      LatLng(26.8467, 80.9462), // Lucknow
      LatLng(22.5726, 88.3639), // Kolkata
      LatLng(12.9716, 77.5946), // Bangalore
      LatLng(13.0827, 80.2707), // Chennai
      LatLng(17.3850, 78.4867), // Hyderabad
      LatLng(23.0225, 72.5714), // Ahmedabad
      // LatLng(18.5204, 73.8567), // Pune
      // LatLng(26.9124, 75.7873), // Jaipur
      // LatLng(22.3072, 73.1812), // Vadodara
      // LatLng(30.7333, 76.7794), // Chandigarh
      // LatLng(11.0168, 76.9558), // Coimbatore
      // LatLng(21.1702, 72.8311), // Surat
      // LatLng(9.9312, 76.2673), // Kochi
    ];
  }

  void _onMapCreated(GoogleMapController controller) {}

  Future buildBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 219, 232, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 21),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.circular(50)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Start",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Image(
                                height: 30,
                                width: 30,
                                image: AssetImage("assets/barcode.png")),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Radission Blu Hotel 1",
                                style: TextStyle(color: Colors.indigo[900]),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Clock-in:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                    TextSpan(
                                        text: "10:00 AM",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: checkInData.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 64,
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 4, 32, 4),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("CP${index + 1}"),
                                    Padding(
                                        padding: checkInData[index] ==
                                                checkInData.elementAt(3)
                                            ? const EdgeInsets.only(
                                                left: 9, right: 30)
                                            : const EdgeInsets.only(
                                                left: 12, right: 30),
                                        child: checkInData[index]['status'] ==
                                                'Visited'
                                            ? Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              )
                                            : checkInData[index]['status'] ==
                                                    'Missed'
                                                ? Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  )
                                                : checkInData[index] ==
                                                        checkInData.elementAt(3)
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            Colors.indigo[900],
                                                        size: 14,
                                                        shadows: const [
                                                          Shadow(
                                                            color: Colors.blue,
                                                            blurRadius: 7,
                                                          )
                                                        ],
                                                      )
                                                    :
                                                    // : checkInData[index]
                                                    //             ['status'] ==
                                                    //         'Check-in'
                                                    //     ?
                                                    Container(
                                                        height: 8,
                                                        width: 8,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ))
                                  ],
                                ),
                                title: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image(
                                          height: 30,
                                          width: 30,
                                          image:
                                              AssetImage("assets/barcode.png")),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Radission Blu Hotel 1",
                                          style: TextStyle(
                                              color: Colors.indigo[900]),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text:
                                                    "${checkInData[index]['status']} ",
                                                style: TextStyle(
                                                    color: checkInData[index]
                                                                ['status'] ==
                                                            'Visited'
                                                        ? Colors.green
                                                        : checkInData[index][
                                                                    'status'] ==
                                                                'Missed'
                                                            ? Colors.red
                                                            : Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                children: [
                                              TextSpan(
                                                  text: checkInData[index]
                                                              ['status'] ==
                                                          'Check-in'
                                                      ? ':'
                                                      : ''),
                                              TextSpan(
                                                  text:
                                                      "${checkInData[index]['time']}",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.location_searching_outlined,
                                  color: Colors.indigo[900],
                                ),
                              ),
                            ),
                            if (index == checkInData.length - 1)
                              Container()
                            else
                              const Positioned(
                                  top: 38,
                                  left: 50.5,
                                  child: SizedBox(
                                    width: 10,
                                    height: 50,
                                    child: VerticalDivider(
                                      indent: 2,
                                      width: 20,
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ))
                          ],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 219, 232, 1),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 21),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.circular(50)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "End",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Image(
                                height: 30,
                                width: 30,
                                image: AssetImage("assets/barcode.png")),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Radission Blu Hotel 1",
                                style: TextStyle(color: Colors.indigo[900]),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Clock-out:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                    TextSpan(
                                        text: "10:00 AM",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          );
        });
  }
}
