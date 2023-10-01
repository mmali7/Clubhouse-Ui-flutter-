import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist/data.dart';

import '../widgets/room_card.dart';
import '../widgets/user_profile_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.envelope_open,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.calendar,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell,
                size: 28,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: UserProfileImage(
                  size: 34.0,
                  imageUrl: currentUser.imageURL,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [...roomList.map((e) => RoomCard(room: e))],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                )),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  size: 21,
                  color: Colors.white,
                ),
                label: Text(
                  'start a room',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  backgroundColor: Theme.of(context).hintColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
