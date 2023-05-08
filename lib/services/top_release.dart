import 'dart:convert';

import 'package:spotify/models/top_release.dart';
import 'package:http/http.dart' as http;

class TopRelease {
// method: 'GET',
//   url: 'https://spotify-data-api1.p.rapidapi.com/playlists/categories-playlists',
//   params: {
  // type: 'mood',
  // limit: '20',
  // offset: '0'
//   },
//   headers: {
  // 'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
  // 'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com'
//   }
// };

  Future<List<ToModel>> getTopReleases() async {
    var endpoint = Uri.https(
        "spotify-data-api1.p.rapidapi.com",
        "/playlists/categories-playlists",
        {'type': 'mood', 'limit': '20', 'offset': '0'});

    final response = await http.get(endpoint, headers: {
      'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
      'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List body = json;
      List<ToModel> releases =
          body.map((dynamic item) => ToModel.FromJSON(item)).toList();
      return releases;
    } else {
      throw ("something went wrong");
    }
  }
}
