class Name {
  final String name;

  Name({required this.name});

  factory Name.empty() {
    return Name(name: "");
  }
}
