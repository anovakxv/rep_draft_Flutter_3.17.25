import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChanged;

  const ProfileTabs({
    Key? key,
    required this.activeTab,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 34,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          _buildTabItem('Rep', '/profile-rep'),
          _buildTabItem('Goals', '/profile-goals'),
          _buildTabItem('Write', '/profile-write', hasBorder: false),
        ],
      ),
    );
  }

  Widget _buildTabItem(String tabName, String route, {bool hasBorder = true}) {
    final isActive = activeTab == tabName;

    return Expanded(
      child: InkWell(
        onTap: () => onTabChanged(tabName),
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.transparent,
            border: hasBorder
                ? Border(
                    right: BorderSide(color: Colors.black, width: 1),
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            tabName,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontFamily: 'Roboto',
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
