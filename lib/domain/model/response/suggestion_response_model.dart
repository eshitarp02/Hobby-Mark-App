class SuggestionResponseModel {
  List<Suggestions>? suggestions;

  SuggestionResponseModel({
    this.suggestions,
  });

  SuggestionResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (suggestions != null) {
      data['suggestions'] = suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  Ui? ui;
  List<String>? bodyLines;
  Cta? cta;
  Meta? meta;

  Suggestions({
    this.ui,
    this.bodyLines,
    this.cta,
    this.meta,
  });

  Suggestions.fromJson(Map<String, dynamic> json) {
    ui = json['ui'] != null ? Ui.fromJson(json['ui']) : null;
    bodyLines = json['bodyLines'].cast<String>();
    cta = json['cta'] != null ? Cta.fromJson(json['cta']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ui != null) {
      data['ui'] = ui!.toJson();
    }
    data['bodyLines'] = bodyLines;
    if (cta != null) {
      data['cta'] = cta!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Ui {
  String? title;

  Ui({
    this.title,
  });

  Ui.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}

class Cta {
  String? id;
  String? label;
  String? action;
  Payload? payload;

  Cta({
    this.id,
    this.label,
    this.action,
    this.payload,
  });

  Cta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    action = json['action'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['action'] = action;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? activityId;
  String? activityType;
  String? description;
  String? bookmark;

  Payload({
    this.activityId,
    this.activityType,
    this.description,
    this.bookmark,
  });

  Payload.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    activityType = json['activityType'];
    description = json['description'];
    bookmark = json['bookmark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityId'] = activityId;
    data['activityType'] = activityType;
    data['description'] = description;
    data['bookmark'] = bookmark;
    return data;
  }
}

class Meta {
  String? source;
  String? mood;
  String? timestamp;

  Meta({
    this.source,
    this.mood,
    this.timestamp,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    mood = json['mood'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['mood'] = mood;
    data['timestamp'] = timestamp;
    return data;
  }
}
