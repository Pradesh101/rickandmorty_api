class InfoModel {
  final int count;
  final int pages;
  final String next;
  final String prev;

  InfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  // Map<String, dynamic> toJson() => {
  //     "count": count,
  //     "pages": pages,
  //     "next": next,
  //     "prev": prev,
  // };
}
