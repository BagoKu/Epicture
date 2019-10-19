class GalleryTags {
  String name;
  String displayName;
  int followers;
  int totalItems;
  bool following;
  bool isWhitelisted;
  String backgroundHash;
  String thumbnailHash;
  String accent;
  bool backgroundIsAnimated;
  bool thumbnailIsAnimated;
  bool isPromoted;
  String description;
  String logoHash;
  String logoDestinationUrl;
  DescriptionAnnotations descriptionAnnotations;

  GalleryTags({this.name, this.displayName, this.followers, this.totalItems, this.following, this.isWhitelisted, this.backgroundHash, this.thumbnailHash, this.accent, this.backgroundIsAnimated, this.thumbnailIsAnimated, this.isPromoted, this.description, this.logoHash, this.logoDestinationUrl, this.descriptionAnnotations});

  GalleryTags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['display_name'];
    followers = json['followers'];
    totalItems = json['total_items'];
    following = json['following'];
    isWhitelisted = json['is_whitelisted'];
    backgroundHash = json['background_hash'];
    thumbnailHash = json['thumbnail_hash'];
    accent = json['accent'];
    backgroundIsAnimated = json['background_is_animated'];
    thumbnailIsAnimated = json['thumbnail_is_animated'];
    isPromoted = json['is_promoted'];
    description = json['description'];
    logoHash = json['logo_hash'];
    logoDestinationUrl = json['logo_destination_url'];
    descriptionAnnotations = json['description_annotations'] != null ? new DescriptionAnnotations.fromJson(json['description_annotations']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['followers'] = this.followers;
    data['total_items'] = this.totalItems;
    data['following'] = this.following;
    data['is_whitelisted'] = this.isWhitelisted;
    data['background_hash'] = this.backgroundHash;
    data['thumbnail_hash'] = this.thumbnailHash;
    data['accent'] = this.accent;
    data['background_is_animated'] = this.backgroundIsAnimated;
    data['thumbnail_is_animated'] = this.thumbnailIsAnimated;
    data['is_promoted'] = this.isPromoted;
    data['description'] = this.description;
    data['logo_hash'] = this.logoHash;
    data['logo_destination_url'] = this.logoDestinationUrl;
    if (this.descriptionAnnotations != null) {
      data['description_annotations'] = this.descriptionAnnotations.toJson();
    }
    return data;
  }
}

class DescriptionAnnotations {

DescriptionAnnotations.fromJson(Map<String, dynamic> json);

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}