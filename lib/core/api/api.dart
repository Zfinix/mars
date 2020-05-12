import 'dart:convert';

import 'package:mars/core/const/api_key.dart';
import 'package:mars/core/model/nasa_rover_model.dart';
import 'package:http/http.dart' as http;
import 'package:mars/widgets/dialogs.dart';

class NasaAPI {
  static Future<NASARoverModel> getPhotos(
    context, {
    String rover = "curiosity",
    DateTime dateTime,
  }) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };

      var response = await http.get(
          "https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?earth_date=${dateTime.year}-${dateTime.month}-${dateTime.day}&api_key=$API_KEY",
          headers: headers);
      var marsData = NASARoverModel.fromJson(json.decode(response.body));
      if (marsData?.photos != null && marsData.photos.length > 0)
        return marsData;
      else {
        showErrorDialog(context, error: "No data was found from your query");
        return null;
      }
    } catch (e) {
      showErrorDialog(context, error: "Could not get Mars Data");
      print(e.toString());
    }
    return null;
  }
}
