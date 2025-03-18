import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final VoidCallback onBackPressed;

  const ProfileHeader({
    Key? key,
    required this.userName,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE4E4E4),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Status bar placeholder
          Container(
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 19),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "9:41",
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.signal_cellular_4_bar, size: 16),
                    SizedBox(width: 4),
                    Icon(Icons.wifi, size: 16),
                    SizedBox(width: 4),
                    Icon(Icons.battery_full, size: 16),
                  ],
                ),
              ],
            ),
          ),
          // Header with back button and name
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                InkWell(
                  onTap: onBackPressed,
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Color(0xFF8CC75D),
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(width: 107),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
