class MDAModel {
  final String? id;
  final String? fullname;
  final String? phoneNo;
  final String? officePhoneNo;
  final String? email;
  final String? constId;
  final String? districtId;
  final String? appointmentYear;
  final String? appointmentEnddate;
  final String? type;
  final String? party;
  final String? photo;
  final String? bio;
  final String? status;
  final String? dateCreated;
  final String? code;
  final String? serialno;
  final String? state;
  final String? assemblyId;
  final String? gender;
  final String? partyName;
  final String? stateName;
  final String? constituencyName;
  final String? districtName;
  final List<Projects>? projects;
  final String? typeName;
  MDAModel({
    this.id,
    this.fullname,
    this.phoneNo,
    this.officePhoneNo,
    this.email,
    this.constId,
    this.districtId,
    this.appointmentYear,
    this.appointmentEnddate,
    this.type,
    this.party,
    this.photo,
    this.bio,
    this.status,
    this.dateCreated,
    this.code,
    this.serialno,
    this.state,
    this.assemblyId,
    this.gender,
    this.partyName,
    this.stateName,
    this.constituencyName,
    this.districtName,
    this.projects,
    this.typeName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'phoneNo': phoneNo,
      'officePhoneNo': officePhoneNo,
      'email': email,
      'constId': constId,
      'districtId': districtId,
      'appointmentYear': appointmentYear,
      'appointmentEnddate': appointmentEnddate,
      'type': type,
      'party': party,
      'photo': photo,
      'bio': bio,
      'status': status,
      'dateCreated': dateCreated,
      'code': code,
      'serialno': serialno,
      'state': state,
      'assemblyId': assemblyId,
      'gender': gender,
      'partyName': partyName,
      'stateName': stateName,
      'constituencyName': constituencyName,
      'districtName': districtName,
      'projects': projects?.map((x) => x.toMap()).toList(),
      'typeName': typeName,
    };
  }

  factory MDAModel.fromMap(Map<String, dynamic> map) {
    return MDAModel(
      id: map['id'],
      fullname: map['fullname'],
      phoneNo: map['phone_no'],
      officePhoneNo: map['office_phone_no'],
      email: map['email'],
      constId: map['const_id'],
      districtId: map['district_id'],
      appointmentYear: map['appointment_year'],
      appointmentEnddate: map['appointment_enddate'],
      type: map['type'],
      party: map['party'],
      photo: map['photo'],
      bio: map['bio'],
      status: map['status'],
      dateCreated: map['date_created'],
      code: map['code'],
      serialno: map['serialno'],
      state: map['state'],
      assemblyId: map['assembly_id'],
      gender: map['gender'],
      partyName: map['party_name'],
      stateName: map['state_name'],
      constituencyName: map['constituency_name'],
      districtName: map['district_name'],
      projects: map['projects'] != null
          ? List<Projects>.from(
              map['projects']?.map((x) => Projects.fromMap(x)))
          : null,
      typeName: map['type_name'],
    );
  }
}

class Projects {
  final String? id;
  final String? title;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? lgaId;
  final String? lawmakerId;
  final String? amountAppr;
  final String? amountFunded;
  final String? agencyId;
  final String? ministryId;
  final String? year;
  final String? contractorId;
  final String? projectcategoryId;
  final String? status;
  final String? description;
  final String? type;
  final String? dateCreated;
  final String? stateId;
  final List<String>? photos;
  final String? mda;
  final String? contractorName;
  final int? commentsNo;
  final int? likesNo;
  final int? userLiked;
  final int? dislikesNo;
  final int? userDisliked;
  final int? userFollowed;
  final int? following;
  Projects({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'lgaId': lgaId,
      'lawmakerId': lawmakerId,
      'amountAppr': amountAppr,
      'amountFunded': amountFunded,
      'agencyId': agencyId,
      'ministryId': ministryId,
      'year': year,
      'contractorId': contractorId,
      'projectcategoryId': projectcategoryId,
      'status': status,
      'description': description,
      'type': type,
      'dateCreated': dateCreated,
      'stateId': stateId,
      'photos': photos,
      'mda': mda,
      'contractorName': contractorName,
      'commentsNo': commentsNo,
      'likesNo': likesNo,
      'userLiked': userLiked,
      'dislikesNo': dislikesNo,
      'userDisliked': userDisliked,
      'userFollowed': userFollowed,
      'following': following,
    };
  }

  factory Projects.fromMap(Map<String, dynamic> map) {
    return Projects(
      id: map['id'],
      title: map['title'],
      location: map['location'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      lgaId: map['lga_id'],
      lawmakerId: map['lawmaker_id'],
      amountAppr: map['amount_appr'],
      amountFunded: map['amount_funded'],
      agencyId: map['agency_id'],
      ministryId: map['ministry_id'],
      year: map['year'],
      contractorId: map['contractor_id'],
      projectcategoryId: map['projectcategory_id'],
      status: map['status'],
      description: map['description'],
      type: map['type'],
      dateCreated: map['date_created'],
      stateId: map['state_id'],
      photos: List<String>.from(map['photos']),
      mda: map['mda'],
      contractorName: map['contractor_name'],
      commentsNo: map['comments_no']?.toInt(),
      likesNo: map['likes_no']?.toInt(),
      userLiked: map['user_liked']?.toInt(),
      dislikesNo: map['dislikes_no']?.toInt(),
      userDisliked: map['user_disliked']?.toInt(),
      userFollowed: map['user_followed']?.toInt(),
      following: map['following']?.toInt(),
    );
  }
}
