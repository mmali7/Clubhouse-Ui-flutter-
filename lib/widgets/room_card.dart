import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist/models/room.dart';
import 'package:frist/screens/room_screen.dart';
import 'package:frist/widgets/user_profile_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => RoomScreen(room: room),
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0),
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28,
                              top: 24,
                              child: UserProfileImage(
                                imageUrl: room.speakers[0].imageURL,
                                size: 48.0,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[3].imageURL,
                              size: 48.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  '${e.firstName} ${e.lastName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 15,
                                      ),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  )),
                                  TextSpan(
                                    text: ' /  ${room.speakers.length} ',
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  )),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
