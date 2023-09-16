import 'package:flutter/material.dart';

import 'package:cv_editable_app/models/model.dart';

import '../widgets/text_form_field_widget.dart';


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
        title: const Text('Edit User Information'),
      ),
      body:GestureDetector(
        onTap: () {
          // Close the keyboard by unfocusing the current focus node
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child:  Container(
            margin:  const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 10.0,left: 10.0),
            decoration:  BoxDecoration(
              border: Border.all(
                color: Colors.teal,
                style: BorderStyle.solid,
                width: 2.0,
              ),
              color: Colors.white,
              borderRadius:const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormFieldStyling(
                      controller: _fullNameController,
                  labelText: 'Full Name',
                  hinText: 'Please enter your full name',
                  validatorMessage: 'please enter your full name'),
                  TextFormFieldStyling(
                      controller: _stackNameController,
                      labelText: 'Your Stack',
                      hinText: 'Please enter your Stack',
                      validatorMessage: 'please enter your Stack'),
                  TextFormFieldStyling(

                      controller: _slackNameController,
                      labelText: 'Slack Username',
                      hinText: 'Please enter your Slack Username',
                      validatorMessage: 'please enter your Slack Username'),
                  TextFormFieldStyling(

                      controller: _githubHandleController,
                      labelText: 'GitHub Link',
                      hinText: 'Please enter your GitHub Link',
                      validatorMessage: 'Please enter your GitHub Link',),
                  TextFormFieldStyling(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLine: 5,
                      minLine: 2,
                      controller: _bioController,
                      labelText: 'Bio',
                      hinText: 'Tell us about yourself...',
                      validatorMessage: 'Please enter your bio'),
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
                        // Check if widget.userInformation is null and handle it accordingly
                        if (widget.userInformation != null) {
                          widget.onUpdate(updatedInfo);
                        } else {

                        }
                        // Pop back to the previous screen
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Update'),
                  ),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
        ),
          ),),
      ) ,

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
