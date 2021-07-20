import 'dart:convert';

final String tableNotes = 'notes';
class NoteFields {
  static final List<String> values = [id, isImportant, number, title, description, createdTime];
  static final String id = 'id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String createdTime = 'createdTime';
}

class Note {
  final int? id;
  final int isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });
  


  Note copyWith({
    int? id,
    int? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) {
    return Note(
      id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isImportant': isImportant,
      'number': number,
      'title': title,
      'description': description,
      'createdTime':createdTime.toIso8601String(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      isImportant: map['isImportant'],
      number: map['number'],
      title: map['title'],
      description: map['description'],
      createdTime: DateTime.parse(map['createdTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Note(id: $id, isImportant: $isImportant, number: $number, title: $title, description: $description, createdTime: $createdTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Note &&
      other.id == id &&
      other.isImportant == isImportant &&
      other.number == number &&
      other.title == title &&
      other.description == description &&
      other.createdTime == createdTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isImportant.hashCode ^
      number.hashCode ^
      title.hashCode ^
      description.hashCode ^
      createdTime.hashCode;
  }
}
