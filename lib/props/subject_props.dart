class SubjectProps {
  final int id;

  final String image;

  final String text;

  int? academy;

  SubjectProps(this.id, this.image, this.text, this.academy);

  factory SubjectProps.fromJson(Map<String, dynamic> json) {
    return SubjectProps(
      json['subject_id'],
      json['academy_id'],
      json['image'],
      json['name'],
    );
  }
}

class GenericProps {
  final int id;

  final String image;

  final String text;

  GenericProps(this.id, this.image, this.text);
}
