import 'package:flutter/material.dart';
import 'package:tcf_dio/src/models/movement.dart';

class MovementsCard extends StatelessWidget {
  final String name;
  final List<Video> videos;

  const MovementsCard({
    Key key,
    this.name,
    this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _VideosView(
      movementName: name,
      videos: videos,
    );
  }
}

class _VideosView extends StatelessWidget {
  final String movementName;
  final List<Video> videos;

  const _VideosView({
    Key key,
    @required this.videos,
    this.movementName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3,
            child: ListTile(
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      movementName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        /// https://www.youtube.com/watch?v=JadgYV2qnsQ
                        /// final video = 'https://www.youtube.com/watch?v=${videos[index].id}';
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          videos[index].thumbnails.medium.url,
                          height: 180,
                          width: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Center(child: Text(videos[index].title)),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(videos[index].description),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
