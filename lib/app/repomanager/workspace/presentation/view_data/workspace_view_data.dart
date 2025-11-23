class WorkSpaceViewData {
  final String path;
  final String name;
  final String description;

  WorkSpaceViewData({required this.path, required this.name, required this.description});

  WorkSpaceViewData copyWith({
    String? path,
    String? name,
    String? description,
  }) => WorkSpaceViewData(
    path: path ?? this.path,
    name: name ?? this.name,
    description: description ?? this.description,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkSpaceViewData &&
        other.path == path &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => path.hashCode ^ name.hashCode ^ description.hashCode;
}