import 'package:flutter/material.dart';

import 'package:cv_editable_app/models/model.dart';


class EditUserInfoScreen extends StatefulWidget {
  final UserInformation userInformation;
  final Function(UserInformation) onUpdate;

  EditUserInfoScreen({required this.userInformation, required this.onUpdate});

  @override
  _EditUserInfoScreenState createState() => _EditUserInfoScreenState();
}

class _EditUserInfoScreenState extends State<EditUserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _stackNameController;
  late TextEditingController _slackNameController;
  late TextEditingController _githubHandleController;
  late TextEditingController _bioController;


  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.userInformation.fullName);
    _stackNameController = TextEditingController(text: widget.userInformation.stackName);
    _slackNameController = TextEditingController(text: widget.userInformation.slackUsername);
    _githubHandleController = TextEditingController(text: widget.userInformation.githubHandle);
    _bioController = TextEditingController(text: widget.userInformation.bio);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Information'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'FullName'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _stackNameController,
              decoration: InputDecoration(labelText: 'StackName'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your stack name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _slackNameController,
              decoration: InputDecoration(labelText: 'SlackName'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your slackName';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _githubHandleController,
              decoration: InputDecoration(labelText: 'GitHub Handle'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your GitHub Handle';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your bio';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Create a new UserInformation object with updated values
                  final updatedInfo = UserInformation(
                    fullName: _fullNameController.text,
                    stackName: _stackNameController.text,
                    slackUsername: _slackNameController.text,
                    githubHandle: _githubHandleController.text,
                    bio: _bioController.text,
                  );

                  // Call the onUpdate function to update the user information
                  widget.onUpdate(updatedInfo);

                  // Pop back to the previous screen
                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _bioController.dispose();
    _githubHandleController.dispose();
    _slackNameController.dispose();
    _stackNameController.dispose();

    super.dispose();
  }
}
