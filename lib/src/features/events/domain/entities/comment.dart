class CommentEntity {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,

  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentEntity &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          id == other.id &&
          name == other.name &&
          body == other.body;

  @override
  int get hashCode =>
      id.hashCode ^ postId.hashCode ^ name.hashCode ^ body.hashCode;
}
