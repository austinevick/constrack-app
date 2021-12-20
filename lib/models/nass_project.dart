import 'dart:convert';

ProjectMainModel projectMainModelFrom(String str) =>
    ProjectMainModel.fromJson(json.decode(str));

class ProjectMainModel {
  ProjectMainModel({
    this.totalProjects,
    this.projects,
  });

  int? totalProjects;
  List<ProjectModel>? projects;

  factory ProjectMainModel.fromJson(Map<String, dynamic> json) =>
      ProjectMainModel(
        totalProjects: json["total_projects"],
        projects: List<ProjectModel>.from(
            json["projects"].map((x) => ProjectModel.fromJson(x))),
      );
}

class ProjectModel {
  ProjectModel({
    this.id,
    this.title,
    this.location,
    this.latitude,
    this.longitude,
    this.lgaId,
    this.lawmakerId,
    this.amountAppr,
    this.amountFunded,
    this.agencyId,
    this.ministryId,
    this.year,
    this.contractorId,
    this.projectcategoryId,
    this.status,
    this.description,
    this.type,
    this.dateCreated,
    this.stateId,
    this.photos,
    this.mda,
    this.contractorName,
    this.commentsNo,
    this.likesNo,
    this.userLiked,
    this.dislikesNo,
    this.userDisliked,
    this.userFollowed,
    this.following,
  });

  String? id;
  String? title;
  String? location;
  dynamic latitude;
  dynamic longitude;
  String? lgaId;
  String? lawmakerId;
  String? amountAppr;
  dynamic amountFunded;
  String? agencyId;
  String? ministryId;
  String? year;
  String? contractorId;
  String? projectcategoryId;
  String? status;
  dynamic description;
  String? type;
  String? dateCreated;
  String? stateId;
  List<dynamic>? photos;
  dynamic mda;
  dynamic contractorName;
  int? commentsNo;
  int? likesNo;
  int? userLiked;
  int? dislikesNo;
  int? userDisliked;
  int? userFollowed;
  int? following;

  static List<ProjectModel> fromJsonList(String json) {
    final listData = jsonDecode(json) as List;
    return listData
        .map<ProjectModel>((json) => ProjectModel.fromJson(json))
        .toList();
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        title: json["title"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        lgaId: json["lga_id"],
        lawmakerId: json["lawmaker_id"],
        amountAppr: json["amount_appr"],
        amountFunded: json["amount_funded"],
        agencyId: json["agency_id"],
        ministryId: json["ministry_id"],
        year: json["year"],
        contractorId: json["contractor_id"],
        projectcategoryId: json["projectcategory_id"],
        status: json["status"],
        description: json["description"],
        type: json["type"],
        dateCreated: json["date_created"],
        stateId: json["state_id"],
        photos: json["photos"] != null
            ? List<dynamic>.from(json["photos"].map((x) => x))
            : null,
        mda: json["mda"],
        contractorName: json["contractor_name"],
        commentsNo: json["comments_no"],
        likesNo: json["likes_no"],
        userLiked: json["user_liked"],
        dislikesNo: json["dislikes_no"],
        userDisliked: json["user_disliked"],
        userFollowed: json["user_followed"],
        following: json["following"],
      );
}
