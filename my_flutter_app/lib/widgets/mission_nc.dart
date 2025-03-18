import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'mission_nc_model.dart';

class MissionNC extends StatefulWidget {
  final String? projectTitle;
  final String? projectImage;

  const MissionNC({
    Key? key,
    this.projectTitle,
    this.projectImage,
  }) : super(key: key);

  @override
  _MissionNCState createState() => _MissionNCState();
}

class _MissionNCState extends State<MissionNC> {
  String activeTab = 'story';
  late String projectTitle;
  late String projectImage;
  Users users = Users(leads: [], contributors: []);

  @override
  void initState() {
    super.initState();
    projectTitle = widget.projectTitle ?? "Networked Capital";
    projectImage = widget.projectImage ??
        "https://cdn.builder.io/api/v1/image/assets/TEMP/06a95f73d05bfcc82110cc68bcd20d051cd1d57dac200d36449bddeae10773f2";
    fetchUsers();
  }

  void setActiveTab(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  Future<void> fetchUsers() async {
    try {
      // This would be replaced with your actual API call
      // For now, we'll simulate a delay and return mock data
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock data
      setState(() {
        users = Users(
          leads: [
            User(
                id: '1',
                name: 'MP',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/68ae988fbe6c2e56903258b9e68721d8fddf60f30550c0affd824ca4a206684a?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '2',
                name: 'CP',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/f29954bd6f06a9699865d3bad8e73ac6d8a83882a17c19c119bdfd185ebc75e5?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '3',
                name: 'MN',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/d89fdda0735df03f699f3d7d3d14970a092592767525979bf8efd6dca9c8c071?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '4',
                name: 'AN',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/3e205934b31a2efa12649ef6919f348ca15b4fdea9d4d2c5e55eb7688541e18c?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '5',
                name: 'HJ',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/3b02da8f80137814b70f65971fec46035ad10629e7160d94dd9bde85977b52e5?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
          ],
          contributors: [
            User(
                id: '6',
                name: 'AN',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/fb149407a98bc20b19ab0c6c864b9d185d44c32f42631bec48b21a06113a2bb4?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '7',
                name: 'HJ',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/61625b14180b7c1a9481eec18d60d211059a7981edaad1eef329cb99cf907c40?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            User(
                id: '8',
                name: 'AO',
                avatar:
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/91a2e0c0bf79bb5ec1a6a992e510ce17cc2669e0937643909d9f717586402321?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
          ],
        );
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: auto),
                padding: const EdgeInsets.only(bottom: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header section
                    _buildHeader(),

                    // Project image section
                    _buildProjectImage(),

                    // Tab navigation
                    _buildTabNavigation(),

                    // Divider
                    Container(
                      height: 1,
                      width: 400,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE4E4E4),
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),

                    // Contributors section
                    _buildContributors(),

                    // Leads section
                    _buildLeads(),

                    // Project description
                    _buildProjectDescription(),
                  ],
                ),
              ),
            ),

            // Fixed bottom navigation bar
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFF9F9F9),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
      child: Stack(
        children: [
          // Left side with time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '9:4',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.28,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '1',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/a398ba00952c53b13b747d5769dd3cb04cc68abfadbe821696f1bad07761f741?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          // Right side with status icons
          Positioned(
            right: 35,
            top: 13,
            child: Row(
              children: [
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/e70e566cf1143a39a400aff9c8ebcb5d12d79198015444e0e5b556e354c5adf8?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/5e9d99f464ed265a4827f7db201ba880fc310248b3a07f96786c438ffae2a1ee?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          // Center title
          Positioned(
            left: 0,
            right: 0,
            top: 31,
            child: Center(
              child: Text(
                projectTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      width: double.infinity,
      height: 238,
      padding: const EdgeInsets.fromLTRB(15, 234, 15, 3),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              projectImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE4E4E4),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      constraints: const BoxConstraints(maxWidth: 399),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              'Story',
              'story',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
          ),
          Expanded(
            child: _buildTabButton('Offering', 'offering'),
          ),
          Expanded(
            child: _buildTabButton(
              'Results',
              'results',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, String tabId,
      {BorderRadius? borderRadius}) {
    final isActive = activeTab == tabId;

    return InkWell(
      onTap: () => setActiveTab(tabId),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: borderRadius,
          border: tabId != 'story'
              ? Border.all(color: Colors.black, width: 1)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildContributors() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 16, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...users.contributors.map((user) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(user.avatar),
                ),
              )),
          // Add placeholder avatars if needed
          if (users.contributors.isEmpty) ...[
            _buildAvatarImage(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/fb149407a98bc20b19ab0c6c864b9d185d44c32f42631bec48b21a06113a2bb4?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            _buildAvatarImage(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/61625b14180b7c1a9481eec18d60d211059a7981edaad1eef329cb99cf907c40?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
            _buildAvatarImage(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/91a2e0c0bf79bb5ec1a6a992e510ce17cc2669e0937643909d9f717586402321?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatarImage(String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(url),
      ),
    );
  }

  Widget _buildLeads() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: -32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leads row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Leads:',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              ...users.leads.take(5).map((user) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                  )),
              // Add placeholder avatars if needed
              if (users.leads.isEmpty) ...[
                _buildAvatarImage(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/68ae988fbe6c2e56903258b9e68721d8fddf60f30550c0affd824ca4a206684a?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
                _buildAvatarImage(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/f29954bd6f06a9699865d3bad8e73ac6d8a83882a17c19c119bdfd185ebc75e5?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
                _buildAvatarImage(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/d89fdda0735df03f699f3d7d3d14970a092592767525979bf8efd6dca9c8c071?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
                _buildAvatarImage(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/3e205934b31a2efa12649ef6919f348ca15b4fdea9d4d2c5e55eb7688541e18c?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
                _buildAvatarImage(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/3b02da8f80137814b70f65971fec46035ad10629e7160d94dd9bde85977b52e5?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f'),
              ],
            ],
          ),

          // Names row 1
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('MP',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                SizedBox(width: 17),
                Text('CP',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                SizedBox(width: 17),
                Text('MN',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),

          // Names row 2
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: -24),
            width: 208,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('AN',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text('HJ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text('AO',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text('RH',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text('KR',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text('JB',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Colors.black,
                height: 1.25,
              ),
              children: [
                TextSpan(
                  text: 'Networked Capital',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                    text:
                        'is a coalition working together on shared principles.'),
                TextSpan(text: '\n\n'),
                TextSpan(
                  text: 'Our goal is to open source the next big company',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: ' — to: innovate how we invest in People.'),
                TextSpan(text: '\n\n'),
                TextSpan(
                  text:
                      'Our Mission is to improve the health of human capital.',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: '\n\n'),
                TextSpan(
                  text:
                      'We do this by investing financial capital through a transparently articulated framework of timeless ',
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Handle link tap
            },
            child: const Text(
              'Principles',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Text(
            '.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'We empower people to:',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint('Maximize their strengths'),
          _buildBulletPoint('Have access to resources and incentives'),
          _buildBulletPoint(
              'Increase the efficiency, agility, and quality of work'),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE4E4E4),
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.only(bottom: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 345),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF7BBF4B),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                              shadowColor:
                                  const Color(0xFF7BBF4B).withOpacity(0.1),
                            ),
                            child: Image.network(
                              'https://cdn.builder.io/api/v1/image/assets/TEMP/239ce2bc0ecd48e82606b7b17e9ef300a0370adf2b04059541d256922f2a5e50?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: const BorderSide(
                              color: Color(0xFFE4E4E4),
                              width: 1,
                            ),
                          ),
                          child: Image.network(
                            'https://cdn.builder.io/api/v1/image/assets/TEMP/3628d031652289af709575c878c2b3c18ab234153712aa6810191dba2f20c1e6?placeholderIfAbsent=true&apiKey=c8d530c75cd1478687ed622797fda84f',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
