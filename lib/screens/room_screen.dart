import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist/models/room.dart';
import 'package:frist/widgets/room_user_Profile.dart';

import '../data.dart';
import '../widgets/user_profile_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        elevation: 0,
        leading: TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('Hallway'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                      ),
                      Icon(CupertinoIcons.ellipsis)
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by Speakers',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 50))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌️ leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[300],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 27,
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      size: 27,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
