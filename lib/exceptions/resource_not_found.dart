class ResourceNotFoundException implements Exception {
  final String name;
  final String id;

  ResourceNotFoundException({
    required this.name,
    required this.id,
  });

  @override
  String toString() {
    return 'ERROR: $id could not be found for $name';
  }
}
