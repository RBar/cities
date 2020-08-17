import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

//* Widget that shows the map of the city

class MapTabWidget extends StatelessWidget {
  final City city;
  const MapTabWidget({Key key, @required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _map(),
    );
  }

  //Create the map widget
  Widget _map() {
    if (city.lat == null || city.lng == null) {
      return const Image(
        image: AssetImage('assets/no_map.jpg'),
        fit: BoxFit.cover,
      );
    }
    return FlutterMap(
      options: MapOptions(
        center: LatLng(city.lat, city.lng),
        zoom: 10,
      ),
      layers: [
        _createmap(),
      ],
    );
  }

  // Get the map from Mapbox
  LayerOptions _createmap() {
    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/roqueb/ckby4vlnk2q2t1ko95xdjmslq/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1Ijoicm9xdWViIiwiYSI6ImNrYnk0MWlkczBvcGkycnBrYjhmNzZwaTUifQ.pdNQFQaF7-ZOfA0hD5PfAQ',
        });
  }
}
