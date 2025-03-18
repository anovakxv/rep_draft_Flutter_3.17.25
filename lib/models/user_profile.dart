class UserProfile {
  final String name;
  final String photo;
  final String repType;
  final String city;
  final List<String> skills;

  UserProfile({
    required this.name,
    required this.photo,
    required this.repType,
    required this.city,
    required this.skills,
  });

  factory UserProfile.defaultProfile() {
    return UserProfile(
      name: "Jose Barrera",
      photo:
          "https://cdn.builder.io/api/v1/image/assets/TEMP/87fbadb180eb8aacf43e8f44ba102e18fea11e27",
      repType: "Lead",
      city: "LA",
      skills: [
        "Human Resources - Scale",
        "Operations - Manufacturing",
        "Sales Social Connector",
      ],
    );
  }
}
