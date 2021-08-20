import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pebbl_health/connect_device.dart';
import 'package:pebbl_health/shared/shared.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final _formKey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();

  String address = "";
  double latitude = 0.0;
  double longitude = 0.0;

  Future<Position> get position =>
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  _getCurrentLocation() async {
    Position pos = await position;
    setState(() {
      latitude = pos.latitude;
      longitude = pos.longitude;
      address = "$latitude, $longitude";
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(

                    children: [
                      Text(
                        "Choose your location",
                        style: textStyle.copyWith(
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.08),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: FutureBuilder(
                                future: position,
                                builder: (context, AsyncSnapshot<Position> snapshot) {
                                  return snapshot.data != null
                                      ? GoogleMap(
                                    mapType: MapType.normal,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(snapshot.data!.latitude,
                                          snapshot.data!.longitude),
                                      zoom: 18.5,
                                    ),
                                    markers: Set<Marker>.of(
                                      <Marker>[
                                        Marker(
                                            draggable: true,
                                            markerId: MarkerId("Marker"),
                                            position: LatLng(latitude, longitude),
                                            icon: BitmapDescriptor.defaultMarker,
                                            onDragEnd: ((newPosition) {
                                              print(
                                                  "LOCATION: ${newPosition
                                                      .latitude}, ${newPosition
                                                      .longitude}");
                                              setState(() {
                                                latitude = newPosition.latitude;
                                                longitude = newPosition.longitude;
                                              });
                                            }))
                                      ],
                                    ),
                                    onMapCreated: (GoogleMapController controller) {
                                      _controller.complete(controller);
                                    },
                                  )
                                      : Container(
                                    child: Center(
                                      child: Text(
                                        "Getting your location...",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.05),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.05),
                                child: Stack(
                                    alignment: AlignmentDirectional.centerEnd,
                                    children: [
                                      TextFormField(
                                        decoration: textInputDecoration.copyWith(
                                            hintText: "Enter your Location"),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.search))
                                    ]),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.15),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.055,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate())
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            PageTransition(
                                                child: ConnectDevice(),
                                                type: PageTransitionType
                                                    .rightToLeft),
                                                (route) => false);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.02)),
                                    color: primaryColorTint,
                                    child: Text(
                                      "Continue",
                                      style: textStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      ),
    );
  }
}
