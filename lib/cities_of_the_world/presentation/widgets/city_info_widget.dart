import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// * Widget that shows the info of the city in the details page

class InfoTabWidget extends StatelessWidget {
  final City city;
  const InfoTabWidget({
    Key key,
    @required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      color: CupertinoColors.white,
      child: Column(
        children: [
          _textRow(label: 'Name: ', text: city.name),
          _textRow(label: 'City id: ', text: city.id.toString()),
          _textRow(label: 'Local name: ', text: city.localName),
          _textRow(label: 'Country: ', text: city.country.name),
          _textRow(
              label: 'Continent: ', text: _continent(city.country.continentId)),
          _textRow(label: 'Latitud: ', text: city.lat.toString()),
          _textRow(label: 'Longitud: ', text: city.lng.toString()),
          _textRow(label: 'Country Code: ', text: city.country.code.toString()),
          _textRow(label: 'Country id: ', text: city.countryId.toString()),
          _textRow(
              label: 'Continent id: ',
              text: city.country.continentId.toString()),
          const SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  // return the Continent name based on the id
  String _continent(int id) {
    switch (id) {
      case 1:
        return 'Asia';
        break;
      case 2:
        return 'Europe';
        break;
      case 3:
        return 'America';
        break;
      case 4:
        return 'Africa';
        break;
      case 5:
        return 'Oceania';
        break;
      case 6:
        return 'America';
        break;
      case 7:
        return 'America';
        break;
      default:
        return 'America';
        break;
    }
  }

  Widget _textRow({@required String label, @required String text}) {
    return Expanded(
      child: Row(
        children: [
          Text(
            label,
            style:
                GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
          Expanded(child: Container()),
          Text(
            text,
            style:
                GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
