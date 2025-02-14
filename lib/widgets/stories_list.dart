import 'package:flutter/material.dart';
import '../models/user_story.dart';
import 'story_avatar.dart';

class StoriesList extends StatelessWidget {
  final List<UserStory> stories;

  const StoriesList({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Set a fixed height for the container
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _buildYourStory(),
            ...stories.map((story) => _buildStoryItem(story)),
          ],
        ),
      ),
    );
  }

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFe9eaec),
            ),
            child: const Center(
              child: Icon(Icons.add, size: 33),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 75,
            child: Align(
              child: Text(
                'Your Story',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStoryItem(UserStory story) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          StoryAvatar(
            imageUrl: story.imageUrl,
            hasStory: story.hasStory,
            isOnline: story.isOnline,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 75,
            child: Align(
              child: Text(
                story.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
