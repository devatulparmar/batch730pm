import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 70,
              // backgroundColor: Colors.red,
              onBackgroundImageError: (Object object, StackTrace? stackTrace) {
                print(object);
              },
              onForegroundImageError: (Object object, StackTrace? stackTrace) {
                print(object);
              },
              foregroundImage: NetworkImage(
                  'https://static.remove.bgsample-gallery/graphics/bird-thumbnail.jpg'),
              backgroundImage: NetworkImage(
                  'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg'),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.network(
              'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}


class Name1 extends StatefulWidget {
  const Name1({Key? key}) : super(key: key);

  @override
  State<Name1> createState() => _NameState();
}

class _NameState extends State<Name1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



class Name3 extends StatelessWidget {
  const Name3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

