class GoalItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String route;
  final bool isCustomBackground;
  final String? backgroundColor;

  GoalItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.route,
    this.isCustomBackground = false,
    this.backgroundColor,
  });
}
