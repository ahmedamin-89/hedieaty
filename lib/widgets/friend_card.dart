import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final String name;
  final String profileImageUrl;
  final int upcomingEvents;
  final VoidCallback onTap;

  const FriendCard({
    super.key,
    required this.name,
    required this.profileImageUrl,
    required this.upcomingEvents,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            profileImageUrl.isNotEmpty ? NetworkImage(profileImageUrl) : null,
      ),
      title: Text(name),
      subtitle: upcomingEvents > 0
          ? Text('Upcoming events: $upcomingEvents')
          : Text(
              "No upcoming events",
              style: TextStyle(color: Colors.grey[600]),
            ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
