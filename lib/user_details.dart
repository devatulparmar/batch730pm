
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  final dynamic arguments;

  const UserDetailsScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First Name : ${widget.arguments['first_name']}"),
            Text("Last Name : ${widget.arguments['last_name']}"),
            Text("Gender : ${widget.arguments['gender']}"),
            Text("Hobbies : ${widget.arguments['dancing']}, ${widget.arguments['reading']}, ${widget.arguments['painting']}"),
            Text("City : ${widget.arguments['city']}"),
            Text("Date of Birth : ${widget.arguments['dob']}"),
          ],
        ),
      ),
    );
  }
}
