import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify/models/artists_profile.dart';

class Getapi {
// method: 'GET',
//   url: 'https://spotify-data-api1.p.rapidapi.com/artists/0TnOYISbd1XYRBk9myaseg/related-artists',
//   headers: {
  // 'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
  // 'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com'
//   }
// };
  Future<List<AtristProfile>> getArtistProfile() async {
    var endpoint = Uri.https(
      "spotify-data-api1.p.rapidapi.com",
      "/artists/0TnOYISbd1XYRBk9myaseg/related-artists",
    );
    final respones = await http.get(endpoint, headers: {
      'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
      'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com'
    });

    if (respones.statusCode == 200) {
      var json = jsonDecode(respones.body);
      List body = json;
      List<AtristProfile> artistProfile =
          body.map((dynamic item) => AtristProfile.fromJSON(item)).toList();
      return artistProfile;
    } else {
      print('Response status code: ${respones.statusCode}');
      print('Response body: ${respones.body}');

      throw ('something went wrong');
    }
  }
}
