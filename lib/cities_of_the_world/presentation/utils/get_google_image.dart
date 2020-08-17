import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/gg_photo.dart';
import 'package:cities_of_the_world_demo/core/apikey/apikey.dart';

class Utils {
  String getggplacesImage(GGPhoto photo) {
    if (photo.photoReference != null) {
      if (photo.height > 1080 && photo.width > 1920) {
        final url =
            'https://maps.googleapis.com/maps/api/place/photo?photoreference=${photo.photoReference}&sensor=false&maxheight=1080&maxwidth=1920&key=$apikey';
        return url;
      } else {
        final url =
            'https://maps.googleapis.com/maps/api/place/photo?photoreference=${photo.photoReference}&sensor=false&maxheight=${photo.height}&maxwidth=${photo.width}&key=$apikey';
        return url;
      }
    } else {
      const url =
          'https://vignette.wikia.nocookie.net/delthanon/images/4/42/Image-not-available_1.jpg';
      return url;
    }
  }
}
