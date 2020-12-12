import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcf_dio/src/branding.dart';

class AthleteCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String profileImageUrl;
  final void onTap;

  const AthleteCard(
      {Key key,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.profileImageUrl, @required this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: tollandCrossFitBlue,
        elevation: 10,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          trailing: Icon(
            FontAwesomeIcons.ellipsisV,
          ),
          leading: CircleAvatar(
            backgroundImage: profileImageUrl != null
                ? NetworkImage(
                    profileImageUrl,
                  )
                : AssetImage('assets/images/tcf_logo_small.png'),
            onBackgroundImageError: (exception, stackTrace) {
              print(exception.toString());
            },
          ),
          title: Text(
            '$firstName $lastName',
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onTap,
          subtitle: Text(email),
        ),
      ),
    );
  }
}
