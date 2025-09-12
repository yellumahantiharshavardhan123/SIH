class MapTilerConfig {
  static const key = String.fromEnvironment('MAPTILER_KEY', defaultValue: 'YOUR_KEY');
  static const styleUrl = 'https://api.maptiler.com/maps/streets/style.json?key=' + key;
}
