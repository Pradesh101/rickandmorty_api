class LocOrigin {
  final String name;
  final String url;

  LocOrigin({required this.name, required this.url});

  factory LocOrigin.fromJson(Map<String, dynamic> json) {
    return LocOrigin(name: json['name'], url: json['url']);
  }
}
