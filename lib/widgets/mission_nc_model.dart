class User {
  final String id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}

class ProjectImages {
  final List<String> images;

  ProjectImages({
    required this.images,
  });

  factory ProjectImages.fromJson(Map<String, dynamic> json) {
    return ProjectImages(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}

class Users {
  final List<User> leads;
  final List<User> contributors;

  Users({
    required this.leads,
    required this.contributors,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      leads: (json['leads'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      contributors: (json['contributors'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leads': leads.map((e) => e.toJson()).toList(),
      'contributors': contributors.map((e) => e.toJson()).toList(),
    };
  }
}

style: ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontFamily: 'Roboto', // Added font family
  ),
),
style: OutlinedButton.styleFrom(
  textStyle: const TextStyle(
    fontFamily: 'Roboto', // Added font family
  ),
),
