import 'package:flutter/material.dart';

import '../models/model.dart';
import 'package:cv_editable_app/screens/edit_user_info_screen.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  UserInformation userInformation = UserInformation(
    fullName: 'Zegenee Raphael',
    stackName: 'Flutter Mobile Developer',
    slackUsername: 'ZeggyRaph',
    githubHandle: 'https',
    bio: 'I\'m a passionate individual who is poised toward providing solution using my programming skills'
  );

  void onUpdate(UserInformation updatedInfo) {
    setState(() {
      userInformation = updatedInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Column(
        children: <Widget>[
          Text('Full Name: ${userInformation.fullName}'),
          Text('Stack Name: ${userInformation.stackName}'),
          Text('Slack username: ${userInformation.slackUsername}'),
          Text('GitHub Link: ${userInformation.githubHandle}'),
          Text('Bio: ${userInformation.bio}'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditUserInfoScreen(
                    userInformation: userInformation,
                    onUpdate: onUpdate,
                  ),
                ),
              );
            },
            child: Text('Edit CV'),
          ),
        ],
      ),
    );
  }
}
