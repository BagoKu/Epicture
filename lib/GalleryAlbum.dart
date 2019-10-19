
class GalleryAlbum {
  String id;
  String title;
  String description;
  int datetime;
  String cover;
  int coverWidth;
  int coverHeight;
  String accountUrl;
  int accountId;
  String privacy;
  String layout;
  int views;
  String link;
  int ups;
  int downs;
  int points;
  int score;
  bool isAlbum;
  String vote;
  bool favorite;
  bool nsfw;
  String section;
  int commentCount;
  int favoriteCount;
  String topic;
  int topicId;
  int imagesCount;
  bool inGallery;
  bool isAd;
  List<Tags> tags;
  int adType;
  String adUrl;
  bool inMostViral;
  bool includeAlbumAds;
  List<Images> images;

  GalleryAlbum(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.cover,
      this.coverWidth,
      this.coverHeight,
      this.accountUrl,
      this.accountId,
      this.privacy,
      this.layout,
      this.views,
      this.link,
      this.ups,
      this.downs,
      this.points,
      this.score,
      this.isAlbum,
      this.vote,
      this.favorite,
      this.nsfw,
      this.section,
      this.commentCount,
      this.favoriteCount,
      this.topic,
      this.topicId,
      this.imagesCount,
      this.inGallery,
      this.isAd,
      this.tags,
      this.adType,
      this.adUrl,
      this.inMostViral,
      this.includeAlbumAds,
      this.images});

  GalleryAlbum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    datetime = json['datetime'];
    cover = json['cover'];
    coverWidth = json['cover_width'];
    coverHeight = json['cover_height'];
    accountUrl = json['account_url'];
    accountId = json['account_id'];
    privacy = json['privacy'];
    layout = json['layout'];
    views = json['views'];
    link = json['link'];
    ups = json['ups'];
    downs = json['downs'];
    points = json['points'];
    score = json['score'];
    isAlbum = json['is_album'];
    vote = json['vote'];
    favorite = json['favorite'];
    nsfw = json['nsfw'];
    section = json['section'];
    commentCount = json['comment_count'];
    favoriteCount = json['favorite_count'];
    topic = json['topic'];
    topicId = json['topic_id'];
    imagesCount = json['images_count'];
    inGallery = json['in_gallery'];
    isAd = json['is_ad'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    adType = json['ad_type'];
    adUrl = json['ad_url'];
    inMostViral = json['in_most_viral'];
    includeAlbumAds = json['include_album_ads'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['datetime'] = this.datetime;
    data['cover'] = this.cover;
    data['cover_width'] = this.coverWidth;
    data['cover_height'] = this.coverHeight;
    data['account_url'] = this.accountUrl;
    data['account_id'] = this.accountId;
    data['privacy'] = this.privacy;
    data['layout'] = this.layout;
    data['views'] = this.views;
    data['link'] = this.link;
    data['ups'] = this.ups;
    data['downs'] = this.downs;
    data['points'] = this.points;
    data['score'] = this.score;
    data['is_album'] = this.isAlbum;
    data['vote'] = this.vote;
    data['favorite'] = this.favorite;
    data['nsfw'] = this.nsfw;
    data['section'] = this.section;
    data['comment_count'] = this.commentCount;
    data['favorite_count'] = this.favoriteCount;
    data['topic'] = this.topic;
    data['topic_id'] = this.topicId;
    data['images_count'] = this.imagesCount;
    data['in_gallery'] = this.inGallery;
    data['is_ad'] = this.isAd;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['ad_type'] = this.adType;
    data['ad_url'] = this.adUrl;
    data['in_most_viral'] = this.inMostViral;
    data['include_album_ads'] = this.includeAlbumAds;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
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

  Tags(
      {this.name,
      this.displayName,
      this.followers,
      this.totalItems,
      this.following,
      this.isWhitelisted,
      this.backgroundHash,
      this.thumbnailHash,
      this.accent,
      this.backgroundIsAnimated,
      this.thumbnailIsAnimated,
      this.isPromoted,
      this.description,
      this.logoHash,
      this.logoDestinationUrl,
      this.descriptionAnnotations});

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
    descriptionAnnotations = json['description_annotations'] != null
        ? new DescriptionAnnotations.fromJson(json['description_annotations'])
        : null;
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

class Images {
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
  String vote;
  bool favorite;
  String nsfw;
  String section;
  String accountUrl;
  String accountId;
  bool isAd;
  bool inMostViral;
  bool hasSound;
  int adType;
  String adUrl;
  String edited;
  bool inGallery;
  String link;
  String commentCount;
  String favoriteCount;
  String ups;
  String downs;
  String points;
  String score;

  Images(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.type,
      this.animated,
      this.width,
      this.height,
      this.size,
      this.views,
      this.bandwidth,
      this.vote,
      this.favorite,
      this.nsfw,
      this.section,
      this.accountUrl,
      this.accountId,
      this.isAd,
      this.inMostViral,
      this.hasSound,
      this.adType,
      this.adUrl,
      this.edited,
      this.inGallery,
      this.link,
      this.commentCount,
      this.favoriteCount,
      this.ups,
      this.downs,
      this.points,
      this.score});

  Images.fromJson(Map<String, dynamic> json) {
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
    adType = json['ad_type'];
    adUrl = json['ad_url'];
    edited = json['edited'];
    inGallery = json['in_gallery'];
    link = json['link'];
    commentCount = json['comment_count'];
    favoriteCount = json['favorite_count'];
    ups = json['ups'];
    downs = json['downs'];
    points = json['points'];
    score = json['score'];
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
    data['ad_type'] = this.adType;
    data['ad_url'] = this.adUrl;
    data['edited'] = this.edited;
    data['in_gallery'] = this.inGallery;
    data['link'] = this.link;
    data['comment_count'] = this.commentCount;
    data['favorite_count'] = this.favoriteCount;
    data['ups'] = this.ups;
    data['downs'] = this.downs;
    data['points'] = this.points;
    data['score'] = this.score;
    return data;
  }
}
