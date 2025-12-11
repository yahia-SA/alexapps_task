class NavItem {
  // For basket/profile icons

  const NavItem({
    required this.iconPath,
    required this.label,
    required this.width,
    required this.height,
    this.isSpecialIcon = false,
  });
  final String iconPath;
  final String label;
  final double width;
  final double height;
  final bool isSpecialIcon;
}
