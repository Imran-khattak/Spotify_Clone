import 'package:flutter/material.dart';
import 'package:spotify/models/feature_playlist.dart';
import 'package:spotify/services/playlist_api.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    PlaylistApi playlist = PlaylistApi();
    return FutureBuilder(
        future: playlist.getPlaylist(),
        builder: (context, AsyncSnapshot<List<FeaturePlaylis>> snapshot) {
          if (snapshot.hasData) {
            List<FeaturePlaylis> featurelist = snapshot.data!.toList();
            return SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: featurelist.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    featurelist[index].banner.toString()),
                              ),
                              title: Text(
                                featurelist[index].playname.toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Text(
                                featurelist[index].description.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300),
                              ),
                              trailing: const Icon(
                                Icons.downloading_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
