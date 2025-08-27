class ActivityLogResponseModel {
  List<Items>? items;
  int? page;
  int? pageSize;
  int? count;
  int? total;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPrevPage;
  AppliedFilters? appliedFilters;

  ActivityLogResponseModel({
    this.items,
    this.page,
    this.pageSize,
    this.count,
    this.total,
    this.totalPages,
    this.hasNextPage,
    this.hasPrevPage,
    this.appliedFilters,
  });

  ActivityLogResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    total = json['total'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
    appliedFilters = json['appliedFilters'] != null
        ? AppliedFilters.fromJson(json['appliedFilters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['count'] = count;
    data['total'] = total;
    data['totalPages'] = totalPages;
    data['hasNextPage'] = hasNextPage;
    data['hasPrevPage'] = hasPrevPage;
    if (appliedFilters != null) {
      data['appliedFilters'] = appliedFilters!.toJson();
    }
    return data;
  }
}

class Items {
  String? activityId;
  String? userId;
  String? activityType;
  String? description;
  String? bookmark;
  String? mood;
  String? timestamp;
  String? lastUpdated;

  Items({
    this.activityId,
    this.userId,
    this.activityType,
    this.description,
    this.bookmark,
    this.mood,
    this.timestamp,
    this.lastUpdated,
  });

  Items.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    userId = json['userId'];
    activityType = json['activityType'];
    description = json['description'];
    bookmark = json['bookmark'];
    mood = json['mood'];
    timestamp = json['timestamp'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityId'] = activityId;
    data['userId'] = userId;
    data['activityType'] = activityType;
    data['description'] = description;
    data['bookmark'] = bookmark;
    data['mood'] = mood;
    data['timestamp'] = timestamp;
    data['lastUpdated'] = lastUpdated;
    return data;
  }
}

class AppliedFilters {
  String? userId;
  String? activityType;
  String? startDate;
  String? endDate;
  int? page;
  int? pageSize;

  AppliedFilters({
    this.userId,
    this.activityType,
    this.startDate,
    this.endDate,
    this.page,
    this.pageSize,
  });

  AppliedFilters.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    activityType = json['activityType'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    page = json['page'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['activityType'] = activityType;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['page'] = page;
    data['pageSize'] = pageSize;
    return data;
  }
}
