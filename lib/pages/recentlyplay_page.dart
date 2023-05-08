import 'package:flutter/material.dart';
import 'package:spotify/models/top_release.dart';
import 'package:spotify/services/top_release.dart';

class RecentlyplayPage extends StatefulWidget {
  const RecentlyplayPage({super.key});

  @override
  State<RecentlyplayPage> createState() => _RecentlyplayPageState();
}

class _RecentlyplayPageState extends State<RecentlyplayPage> {
  @override
  Widget build(BuildContext context) {
    TopRelease topRelease = TopRelease();
    return Column(
      children: [
        FutureBuilder(
            future: topRelease.getTopReleases(),
            builder: (context, AsyncSnapshot<List<ToModel>> snapshot) {
              if (snapshot.hasData) {
                List<ToModel> releaseList = snapshot.data!.toList();
                return SizedBox(
                  height: 270,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: releaseList.length,
                      itemBuilder: (context, index) => Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          releaseList[index]
                                              .songbanner
                                              .toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        releaseList[index].songname.toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
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
            }),
      ],
    );
  }
}
