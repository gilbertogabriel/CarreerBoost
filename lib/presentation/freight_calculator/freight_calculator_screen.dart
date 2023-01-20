import 'package:carrier_boost/presentation/common/components/foo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);

class FreightCalculator extends StatefulWidget {
  const FreightCalculator({Key? key}) : super(key: key);

  @override
  State<FreightCalculator> createState() => _FreightCalculatorState();
}

late GoogleMapController mapController;
Map<String, Marker> _marker = {};

class _FreightCalculatorState extends State<FreightCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(titleAppBar: 'Calculadora de frete'),
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: currentLocation, zoom: 14),
        onMapCreated: ((controller) {
          mapController = controller;
        }),
      ),
    );
  }
}


