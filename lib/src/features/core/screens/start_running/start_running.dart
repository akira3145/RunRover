import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';

const String apiKey = "YOUR_GOOGLE_API_KEY";

class StartRunningScreen extends StatefulWidget {
  const StartRunningScreen({super.key});

  @override
  State<StartRunningScreen> createState() => _StartRunningScreenState();
}

class _StartRunningScreenState extends State<StartRunningScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  LatLng? _destination;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  String _distance = "";
  String _duration = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: const MarkerId("start"),
        position: _currentLocation!,
        infoWindow: const InfoWindow(title: "You are here"),
      ));
    });
  }

  Future<void> _selectDestination(BuildContext context) async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: apiKey,
      mode: Mode.overlay,
      language: "en",
      components: [Component(Component.country, "ph")],
    );

    if (prediction != null) {
      final places = GoogleMapsPlaces(apiKey: apiKey);
      final detail =
          await places.getDetailsByPlaceId(prediction.placeId ?? "");

      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;

      setState(() {
        _destination = LatLng(lat!, lng!);
        _markers.add(Marker(
          markerId: const MarkerId("destination"),
          position: _destination!,
          infoWindow: InfoWindow(title: prediction.description ?? "Destination"),
        ));
      });

      _getRouteAndDistance();
    }
  }

  Future<void> _getRouteAndDistance() async {
    if (_currentLocation == null || _destination == null) return;

    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?"
        "origin=${_currentLocation!.latitude},${_currentLocation!.longitude}"
        "&destination=${_destination!.latitude},${_destination!.longitude}"
        "&key=$apiKey");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    if (data["routes"].isNotEmpty) {
      final points = data["routes"][0]["overview_polyline"]["points"];
      final polylineCoordinates = PolylinePoints()
          .decodePolyline(points)
          .map((e) => LatLng(e.latitude, e.longitude))
          .toList();

      final leg = data["routes"][0]["legs"][0];
      setState(() {
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: const PolylineId("route"),
          points: polylineCoordinates,
          color: Colors.orange,
          width: 5,
        ));
        _distance = leg["distance"]["text"];
        _duration = leg["duration"]["text"];
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              _currentLocation!.latitude < _destination!.latitude
                  ? _currentLocation!.latitude
                  : _destination!.latitude,
              _currentLocation!.longitude < _destination!.longitude
                  ? _currentLocation!.longitude
                  : _destination!.longitude,
            ),
            northeast: LatLng(
              _currentLocation!.latitude > _destination!.latitude
                  ? _currentLocation!.latitude
                  : _destination!.latitude,
              _currentLocation!.longitude > _destination!.longitude
                  ? _currentLocation!.longitude
                  : _destination!.longitude,
            ),
          ),
          80,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Running Route"),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () => _selectDestination(context),
        label: const Text("Set Destination"),
        icon: const Icon(Icons.place),
      ),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) => _mapController = controller,
                    initialCameraPosition:
                        CameraPosition(target: _currentLocation!, zoom: 15),
                    markers: _markers,
                    polylines: _polylines,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ),
                if (_distance.isNotEmpty)
                  Container(
                    color: Colors.black87,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance: $_distance",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text("Duration: $_duration",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
