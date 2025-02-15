import 'package:flutter/material.dart';
import '../models/user_story.dart';
import '../models/conversation.dart';
import '../data/mock_data.dart';
import '../widgets/stories_list.dart';
import '../widgets/conversation_item.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  ConversationsScreenState createState() => ConversationsScreenState();
}

class ConversationsScreenState extends State<ConversationsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<UserStory> stories;
  late List<Conversation> conversations;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    stories = MockData.getMockStories()
        .map((data) => UserStory.fromJson(data))
        .toList();
    conversations = MockData.getMockConversations()
        .map((data) => Conversation.fromJson(data))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshConversations,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: ListView(
              children: [
                _buildHeader(),
                const SizedBox(height: 15),
                _buildSearchBar(),
                const SizedBox(height: 20),
                StoriesList(stories: stories),
                const SizedBox(height: 20),
                _buildConversationsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://randomuser.me/api/portraits/men/31.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text(
          "Chats",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.edit)
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFe9eaec),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        cursorColor: const Color(0xFF000000),
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF000000).withOpacity(0.5),
          ),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildConversationsList() {
    return Column(
      children: conversations
          .map((conversation) => ConversationItem(conversation: conversation))
          .toList(),
    );
  }

  Future<void> _refreshConversations() async {
    await Future.delayed(const Duration(seconds: 2));
    _loadData();
    setState(() {});
  }
}
