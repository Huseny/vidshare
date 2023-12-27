
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.username,
    required this.userImageUrl,
  });

  final String username, userImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userImageUrl),
          radius: 25,
        ),
        Text(
          "@$username",
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
