import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/Widgets/falt_btn.dart';
import 'package:youtube/feachures/auth/service_repo/user_data_service.dart';

final formkey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String email;
  final String profilePic;

  const UsernamePage(
      {super.key,
      required this.displayName,
      required this.email,
      required this.profilePic});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UNPState();
}

class _UNPState extends ConsumerState<UsernamePage> {
  final TextEditingController _userNameController = TextEditingController();
  bool isvalidate = true;

  void userNameValidate() async {
    final mapUsers = await FirebaseFirestore.instance.collection("users").get();
    final users = mapUsers.docs.map((user) => user).toList();
    String? targetedUsername;

    for (var user in users) {
      if (user.data()["userName"] == _userNameController.text) {
        targetedUsername = user.data()["userName"];
        isvalidate = false;
        setState(() {});
      }
      if (_userNameController.text != targetedUsername) {
        isvalidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 14.0),
            child: Text(
              "Enter the UserName",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              child: TextFormField(
                onChanged: (username) => userNameValidate(),
                autovalidateMode: AutovalidateMode.always,
                validator: (username) =>
                    isvalidate ? null : "Username alrady taken",
                key: formkey,
                controller: _userNameController,
                decoration: InputDecoration(
                    suffixIcon: isvalidate
                        ? const Icon(
                            Icons.verified_user_rounded,
                          )
                        : const Icon(
                            Icons.cancel_rounded,
                          ),
                    suffixIconColor: isvalidate
                        ? const Color.fromARGB(255, 20, 218, 185)
                        : Colors.red,
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    )),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
            child: FlatButton(
              text: "CONTINUE",
              onPressed: () async {
                // add users data inside datebase
                isvalidate
                    ? await ref
                        .read(userDataServiceProvider)
                        .addUserDataToFireStore(
                          displayName: widget.displayName,
                          userName: _userNameController.text,
                          email: widget.email,
                          description: "",
                          profilePic: widget.profilePic,
                        )
                    : null;
              },
              color: isvalidate ? Colors.green : Colors.green.shade100,
            ),
          ),
        ],
      ),
    ));
  }
}
