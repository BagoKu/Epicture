class Search {
  String id;
  String title;
  String description;
  int datetime;
  String type;
  bool animated;
  int width;
  int height;
  int size;
  int views;
  int bandwidth;
  int vote;
  bool favorite;
  bool nsfw;
  String section;
  String accountUrl;
  int accountId;
  bool isAd;
  bool inMostViral;
  bool hasSound;
  List<Tags> tags;
  int adType;
  String adUrl;
  int edited;
  bool inGallery;
  String topic;
  int topicId;
  String link;
  String mp4;
  String gifv;
  String hls;
  int mp4Size;
  bool looping;
  AdConfig adConfig;
  int commentCount;
  int favoriteCount;
  int ups;
  int downs;
  int points;
  int score;
  bool isAlbum;

  Search({this.id, this.title, this.description, this.datetime, this.type, this.animated, this.width, this.height, this.size, this.views, this.bandwidth, this.vote, this.favorite, this.nsfw, this.section, this.accountUrl, this.accountId, this.isAd, this.inMostViral, this.hasSound, this.tags, this.adType, this.adUrl, this.edited, this.inGallery, this.topic, this.topicId, this.link, this.mp4, this.gifv, this.hls, this.mp4Size, this.looping, this.adConfig, this.commentCount, this.favoriteCount, this.ups, this.downs, this.points, this.score, this.isAlbum});

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    datetime = json['datetime'];
    type = json['type'];
    animated = json['animated'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    views = json['views'];
    bandwidth = json['bandwidth'];
    vote = json['vote'];
    favorite = json['favorite'];
    nsfw = json['nsfw'];
    section = json['section'];
    accountUrl = json['account_url'];
    accountId = json['account_id'];
    isAd = json['is_ad'];
    inMostViral = json['in_most_viral'];
    hasSound = json['has_sound'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) { tags.add(new Tags.fromJson(v)); });
    }
    adType = json['ad_type'];
    adUrl = json['ad_url'];
    edited = json['edited'];
    inGallery = json['in_gallery'];
    topic = json['topic'];
    topicId = json['topic_id'];
    link = json['link'];
    mp4 = json['mp4'];
    gifv = json['gifv'];
    hls = json['hls'];
    mp4Size = json['mp4_size'];
    looping = json['looping'];
    adConfig = json['ad_config'] != null ? new AdConfig.fromJson(json['ad_config']) : null;
    commentCount = json['comment_count'];
    favoriteCount = json['favorite_count'];
    ups = json['ups'];
    downs = json['downs'];
    points = json['points'];
    score = json['score'];
    isAlbum = json['is_album'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['datetime'] = this.datetime;
    data['type'] = this.type;
    data['animated'] = this.animated;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['views'] = this.views;
    data['bandwidth'] = this.bandwidth;
    data['vote'] = this.vote;
    data['favorite'] = this.favorite;
    data['nsfw'] = this.nsfw;
    data['section'] = this.section;
    data['account_url'] = this.accountUrl;
    data['account_id'] = this.accountId;
    data['is_ad'] = this.isAd;
    data['in_most_viral'] = this.inMostViral;
    data['has_sound'] = this.hasSound;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['ad_type'] = this.adType;
    data['ad_url'] = this.adUrl;
    data['edited'] = this.edited;
    data['in_gallery'] = this.inGallery;
    data['topic'] = this.topic;
    data['topic_id'] = this.topicId;
    data['link'] = this.link;
    data['mp4'] = this.mp4;
    data['gifv'] = this.gifv;
    data['hls'] = this.hls;
    data['mp4_size'] = this.mp4Size;
    data['looping'] = this.looping;
    if (this.adConfig != null) {
      data['ad_config'] = this.adConfig.toJson();
    }
    data['comment_count'] = this.commentCount;
    data['favorite_count'] = this.favoriteCount;
    data['ups'] = this.ups;
    data['downs'] = this.downs;
    data['points'] = this.points;
    data['score'] = this.score;
    data['is_album'] = this.isAlbum;
    return data;
  }
}

class Tags {
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

  Tags({this.name, this.displayName, this.followers, this.totalItems, this.following, this.isWhitelisted, this.backgroundHash, this.thumbnailHash, this.accent, this.backgroundIsAnimated, this.thumbnailIsAnimated, this.isPromoted, this.description, this.logoHash, this.logoDestinationUrl, this.descriptionAnnotations});

  Tags.fromJson(Map<String, dynamic> json) {
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

class AdConfig {
  List<String> safeFlags;
  List<String> highRiskFlags;
  List<String> unsafeFlags;
  bool showsAds;

  AdConfig({this.safeFlags, this.highRiskFlags, this.unsafeFlags, this.showsAds});

  AdConfig.fromJson(Map<String, dynamic> json) {
    safeFlags = json['safeFlags'].cast<String>();
    highRiskFlags = json['highRiskFlags'].cast<String>();
    unsafeFlags = json['unsafeFlags'].cast<String>();
    showsAds = json['showsAds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['safeFlags'] = this.safeFlags;
    data['highRiskFlags'] = this.highRiskFlags;
    data['unsafeFlags'] = this.unsafeFlags;
    data['showsAds'] = this.showsAds;
    return data;
  }
}