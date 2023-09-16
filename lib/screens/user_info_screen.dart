import 'package:cv_editable_app/constants.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import 'package:cv_editable_app/screens/edit_user_info_screen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  UserInformation userInformation = UserInformation(
    fullName: 'Zegenee Raphael',
    stackName: 'Flutter Mobile Developer',
    slackUsername: 'ZeggyRaph',
    githubHandle: 'https://github.com/ZeggyRaph',
    bio: 'I\'m a passionate Flutter developer with a knack for crafting elegant and functional mobile applications. With a strong foundation in Dart and a deep understanding of Flutter\'s UI and state management, I thrive on turning creative ideas into delightful user experiences.'
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
        title: const Center(child: Text('User Information')),
      ),
      body: GestureDetector(
        onTap: () {

          // Close the keyboard by unfocusing the current focus node
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin:  const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10.0,left: 10.0),
          decoration: kContainerDecoration,
          child: Container(
            margin: const EdgeInsets.only(left: 50.0,right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 10),
                  child: Text('${userInformation.fullName}',
                  style: TextStyle(
                      color:Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily:'Candal',
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50,),
                  child: Text('${userInformation.stackName}',
                    style: kPaddingTextStyle,),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Slack username',
                  style: kTextStyle,
                ),
                     Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Text('${userInformation.slackUsername}',
                          style: kPaddingTextStyle,
                      ),
                    ),
                const SizedBox(height: 20.0,),
                const Text('GitHub Link',
                  style: kTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Text(' ${userInformation.githubHandle}',
                    style: kPaddingTextStyle,
                  ),
                ),
                const SizedBox(height: 20.0,),
                const Text('About Me',
                  style: kTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Text(' ${userInformation.bio}',
                    style: kPaddingTextStyle,
                  ),
                ),
                const SizedBox(height: 20.0,),
                Container(
                  margin: const EdgeInsets.only(
                      right: 20.0),
                  width: double.infinity,
                  child: ElevatedButton(
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
                    child: const Text('Edit CV'),
                  ),
                ),
                const SizedBox(height: 20.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
