import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_profile.dart';

class ProfileInfo extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileInfo({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile image
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              userProfile.photo,
              width: 108,
              height: 108,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 108,
                  height: 108,
                  color: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
                );
              },
            ),
          ),
          SizedBox(width: 11),
          // Profile details
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rep type and city
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Rep Type: '),
                        TextSpan(text: userProfile.repType),
                        TextSpan(text: ' City: '),
                        TextSpan(text: userProfile.city),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 7),
                  // Skills list
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      userProfile.skills.length,
                      (index) => Text(
                        '${index + 1}. ${userProfile.skills[index]}',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
