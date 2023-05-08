import 'package:flutter/material.dart';
import 'package:spotify/models/artists_profile.dart';
import 'package:spotify/services/profile_api.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    Getapi getProfile = Getapi();
    return Column(
      children: [
        FutureBuilder(
            future: getProfile.getArtistProfile(),
            builder: (context, AsyncSnapshot<List<AtristProfile>> snapshot) {
              if (snapshot.hasData) {
                List<AtristProfile> profileList = snapshot.data!.toList();
                //  print(profileList.length);
                return SizedBox(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: profileList.length,
                      itemBuilder: (conttext, index) => Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundImage: NetworkImage(
                                          profileList[index]
                                              .image_url
                                              .toString()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Text(
                                      profileList[index].name.toString(),
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
