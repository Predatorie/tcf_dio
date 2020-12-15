import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BenchmarkCard extends StatelessWidget {
  final String name;
  final String description;
  final String category;
  final String scoreType;
  final List<String> movements;
  final Function onTap;

  const BenchmarkCard({
    Key key,
    @required this.name,
    @required this.description,
    @required this.category,
    @required this.scoreType,
    @required this.movements,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Icon(FontAwesomeIcons.userInjured),
          contentPadding: EdgeInsets.all(10),
          onTap: onTap,
          title: Text(name),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6,
              ),
              Text(description),
              SizedBox(
                height: 10,
              ),
              Text(category.toUpperCase()),
              Text('Score: $scoreType'),
              SizedBox(
                height: 6,
              ),
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
