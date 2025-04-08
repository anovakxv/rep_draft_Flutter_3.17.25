import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_profile.dart';
import 'package:flutter_app/models/goal_item.dart';
import 'package:flutter_app/widgets/profile_header.dart';
import 'package:flutter_app/widgets/profile_info.dart';
import 'package:flutter_app/widgets/profile_tabs.dart';
import 'package:flutter_app/widgets/goal_item_widget.dart';
import 'package:flutter_app/widgets/bottom_navigation.dart';

// note
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String activeTab = 'Rep';
  bool isLoading = true;
  late UserProfile userProfile;
  late List<GoalItem> goalItems;

  @override
  void initState() {
    super.initState();
    userProfile = UserProfile.defaultProfile();
    _initGoalItems();
    _fetchUserProfile();
  }

  void _initGoalItems() {
    goalItems = [
      GoalItem(
        id: '1',
        title: 'Economic Advancement',
        description: 'Increasing my income by 50% in 2 years.',
        imageUrl:
            'https://cdn.builder.io/api/v1/image/assets/TEMP/2460fce7187bd62a3df0309aa8e16ea1c3c5db54',
        route: '/economic-advancement',
      ),
      GoalItem(
        id: '2',
        title: 'Boys & Girls Club',
        description: '4 volunteer hours per month',
        imageUrl:
            'https://cdn.builder.io/api/v1/image/assets/TEMP/d4a6a0d0ddb849dfe1884db98a4ec691983e1a16',
        route: '/boys-and-girls-club',
        isCustomBackground: true,
        backgroundColor: '0xFF0093D0',
      ),
      GoalItem(
        id: '3',
        title: 'Education',
        description: '16 hours of coding school per month',
        imageUrl:
            'https://cdn.builder.io/api/v1/image/assets/TEMP/f265c57b67c280fd401dba8430b0d38587d04450',
        route: '/education',
      ),
      GoalItem(
        id: '4',
        title: 'EGT Solar',
        description: 'Sourcing commercial solar leads',
        imageUrl:
            'https://cdn.builder.io/api/v1/image/assets/TEMP/68d3c97d890eeff370980bab2545ba73b2617eb7',
        route: '/egt-solar',
      ),
      GoalItem(
        id: '5',
        title: 'Networked Capital',
        description: 'Building Super-Intelligence together',
        imageUrl:
            'https://cdn.builder.io/api/v1/image/assets/TEMP/461e6c1c1c471394cd09dedd26d51cd4cd28f236',
        route: '/networked-capital',
      ),
    ];
  }

  Future<void> _fetchUserProfile() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  void _handleTabChange(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  void _handleBackPress() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 430,
                ),
                margin: const EdgeInsets.only(
                    bottom: 72), // Space for bottom navigation
                child: Column(
                  children: [
                    // Header
                    ProfileHeader(
                      userName: userProfile.name,
                      onBackPressed: _handleBackPress,
                    ),

                    // Profile info
                    ProfileInfo(userProfile: userProfile),

                    // Tabs
                    ProfileTabs(
                      activeTab: activeTab,
                      onTabChanged: _handleTabChange,
                    ),

                    // Goal items
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: goalItems
                            .map((item) => GoalItemWidget(item: item))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom navigation
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(),
            ),

            // Loading overlay
            if (isLoading)
              Container(
                color: Colors.white.withOpacity(0.7),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF7BBF4B)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
