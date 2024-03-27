class HomeDevices {
  final String title, image, subTitel;
  HomeDevices(
      {required this.title, required this.image, required this.subTitel});
}

List demoHomeDevices = [
  HomeDevices(
    image: "assets/topline.png",
    title: "Top Line 3",
    subTitel: "Humidifier",
  ),
  HomeDevices(
    image: "assets/xiaomi.png",
    title: "Xiaomi",
    subTitel: "Robot vacuum cleaner",
  ),
  HomeDevices(
    image: "assets/lightstar.png",
    title: "Lightstar",
    subTitel: "Desk lamp",
  ),
  HomeDevices(
    image: "assets/alice.png",
    title: "Alice",
    subTitel: "Speaker column",
  ),
  HomeDevices(
    image: "assets/bork.png",
    title: "Brok V530",
    subTitel: "Robot vacuum cleaner",
  ),
  HomeDevices(
    image: "assets/smartbulb.png",
    title: "Smart Bulb-2",
    subTitel: "Smart light bulb",
  ),
  HomeDevices(
    image: "assets/kettle.png",
    title: "Goldair kettle",
    subTitel: "Wifi kettle",
  ),
];
