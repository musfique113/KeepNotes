class NotesImpNames {
  static final String id = "id";
  static final String uniqueID = "uniqueID";
  static final String pin = "pin";
  static final String title = "title";
  static final String content = "content";
  static final String createdTime = "createdTime";
  static final String isArchived = "isArchived";
  static final String TableName = "Notes";
  static final List<String> values = [id, pin, title, content, isArchived];
}

class Note {
  final int? id;
  final bool pin;
  final bool isArchived;
  final String title;
  final String uniqueID;
  final String content;
  final DateTime createdTime;

  Note({
    this.id,
    required this.pin,
    required this.isArchived,
    required this.title,
    required this.uniqueID,
    required this.content,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? pin,
    bool? isArchived,
    String? title,
    String? uniqueID,
    String? content,
    DateTime? createdTime,
  }) {
    return Note(
        id: id ?? this.id,
        pin: pin ?? this.pin,
        isArchived: isArchived ?? this.isArchived,
        title: title ?? this.title,
        content: content ?? this.content,
        uniqueID: uniqueID ?? this.uniqueID,
        createdTime: createdTime ?? this.createdTime);
  }

  static Note fromJson(Map<String, Object?> json) {
    return Note(
        id: json[NotesImpNames.id] as int?,
        pin: json[NotesImpNames.pin] == 1,
        isArchived: json[NotesImpNames.isArchived] == 1,
        title: json[NotesImpNames.title] as String,
        uniqueID: json[NotesImpNames.uniqueID] as String,
        content: json[NotesImpNames.content] as String,
        createdTime: DateTime.parse(json[NotesImpNames.createdTime] as String));
  }

  Map<String, Object?> toJson() {
    return {
      NotesImpNames.id: id,
      NotesImpNames.pin: pin ? 1 : 0,
      NotesImpNames.isArchived: isArchived ? 1 : 0,
      NotesImpNames.title: title,
      NotesImpNames.uniqueID: uniqueID,
      NotesImpNames.content: content,
      NotesImpNames.createdTime: createdTime.toIso8601String()
    };
  }
}
