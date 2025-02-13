import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String imageUrl;
  final bool hasStory;
  final bool isOnline;

  const StoryAvatar({
    Key? key,
    required this.imageUrl,
    required this.hasStory,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: <Widget>[
          hasStory
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: _buildProfileImage(),
                  ),
                )
              : _buildProfileImage(),
          if (isOnline) _buildOnlineIndicator(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildOnlineIndicator() {
    return Positioned(
      top: 38,
      left: 42,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: const Color(0xFF66BB6A),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 3,
          ),
        ),
      ),
    );
  }
}
