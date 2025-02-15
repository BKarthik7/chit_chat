import 'package:flutter/material.dart';
import '../models/conversation.dart';
import 'story_avatar.dart';

class ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const ConversationItem({
    super.key,
    required this.conversation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: <Widget>[
            StoryAvatar(
              imageUrl: conversation.imageUrl,
              hasStory: conversation.hasStory,
              isOnline: conversation.isOnline,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversation.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 135,
                  child: Text(
                    "${conversation.message} - ${conversation.time}",
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 180, 149, 149).withOpacity(0.7),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
