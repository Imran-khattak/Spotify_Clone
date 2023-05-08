import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify/models/feature_playlist.dart';

class PlaylistApi {
  //  method: 'GET',
  // url: 'https://spotify-data-api1.p.rapidapi.com/playlists/featured-playlists',
  // params: {
  // country: 'US',
  // timestamp: '2022-03-23',
  // offset: '0',
  // limit: '20'
  // },
  // headers: {
  // 'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
  // 'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com'
  // }

  Future<List<FeaturePlaylis>> getPlaylist() async {
    var endpoint = Uri.https(
        'spotify-data-api1.p.rapidapi.com', '/playlists/featured-playlists', {
      'country': 'US',
      'timestamp': '2022-03-23',
      'offset': '0',
      'limit': '20'
    });

    final response = await http.get(endpoint, headers: {
      'X-RapidAPI-Key': 'e4f00dd165msh85a314131b747ddp17dd39jsn32e3757fa556',
      'X-RapidAPI-Host': 'spotify-data-api1.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List body = json;
      List<FeaturePlaylis> playlist =
          body.map((dynamic item) => FeaturePlaylis.FromJSON(item)).toList();
      return playlist;
    } else {
      throw ("something went wrong");
    }
  }
}
