import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcf_dio/src/branding.dart';
import 'package:tcf_dio/src/models/workouts.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String description;
  final String scoreType;
  final Track track;
  final List<String> movements;
  final Function onTap;

  const WorkoutCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.scoreType,
    @required this.onTap,
    @required this.track,
    @required this.movements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: _trackColor[track.attributesFor.name.toLowerCase()] != null
            ? _trackColor[track.attributesFor.name.toLowerCase()]
            : Colors.grey,
        elevation: 3,
        child: ListTile(
          isThreeLine: true,
          contentPadding: EdgeInsets.all(10),
          leading: Icon(FontAwesomeIcons.dumbbell),
          title: Text(
            track.attributesFor.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 6,
              ),
              Divider(
                color: tollandCrossFitBlue,
                height: 1,
              ),
              SizedBox(
                height: 6,
              ),
              Text(description),
              SizedBox(
                height: 6,
              ),
              Text(scoreType),
            ],
          ),
        ),
      ),
    );
  }
}

const _trackColor = {
  "workout of the day": tollandCrossFitBlue,
  "burn": tollandCrossFitRed,
  "db go": tollandCrossFitGrey,
  "compete": tollandCrossFitBlack,
};
