import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFragment extends StatefulWidget {
  @override
  _MapFragmentState createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();

  Position _position;

  CameraPosition _userPosition = CameraPosition(
    target: LatLng(5.345317, -4.024429),
    zoom: 9,
  );


  @override
  void initState() {
    super.initState();

    _updateCurrentPosition();
    _addMarkers();
  }

  void _updateCurrentPosition() async {
    try {
      _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(_position.latitude, _position.longitude), 9));

    } catch(e) {
      print('Récuperation de la position Error: ${e.toString()}');
    }
  }

  void _addMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId('mps-holding-adc'),
        position: LatLng(5.383579, -3.974228),
        infoWindow: InfoWindow(
            title: 'MPS Holding / ADC',
            snippet: 'Siège Social'
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Récuperation de la position 2");

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.terrain,
              myLocationEnabled: true,
              trafficEnabled: false,
              initialCameraPosition: _userPosition,
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PreferredSize(
                preferredSize: new Size(MediaQuery.of(context).size.width, 220),
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: new Color.fromRGBO(4, 125, 181, 0.6),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0,),

                          Text("Carte des tickets", textAlign: TextAlign.center,style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          )),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.0)
                            ),

                            child: TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                autofocus: false,
                                style: DefaultTextStyle.of(context).style.copyWith(
                                    fontStyle: FontStyle.italic
                                ),
                                decoration: InputDecoration(
                                  hintText: "Numero ticket",
                                  border: InputBorder.none,
                                  icon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                                ),
                              ),

                              suggestionsCallback: (pattern) async {
                                //var fetchData = await fetchProjets(10, 0, search: pattern);
                                //return fetchData.data.contents;
                                return [];
                              },

                              itemBuilder: (context, myProjet) {
                                return ListTile(
                                  title: Text(myProjet.name),
                                  subtitle: Text('${myProjet.montant} XOF'),
                                );
                              },

                              onSuggestionSelected: (myProjet) {
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjetProfilPage(projet: myProjet)));
                              },
                            ),
                          ),

                          SizedBox(height: 10.0,),
                        ],
                      ),
                    ),

//                    Positioned(
//                      top: 20,
//                      right: 30,
//                      child: Icon(
//                        Icons.power_settings_new,
//                        color: Colors.white,
//                      ),
//                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

