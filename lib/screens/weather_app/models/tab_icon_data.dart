class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/weather_app/tab1.png',
      selectedImagePath: 'assets/weather_app/tab1s.png',
      isSelected: true,
    ),
    TabIconData(
      imagePath: 'assets/weather_app/tab2.png',
      selectedImagePath: 'assets/weather_app/tab2s.png',
      index: 1,
    ),
  ];
}
