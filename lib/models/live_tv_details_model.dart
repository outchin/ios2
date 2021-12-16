class LiveTvDetailsModel {
  String? liveTvId;
  String? tvName;

  String? isPaid;
  var price;
  bool? accessable;
  var watchCount;
  String? description;
  String? slug;
  String? streamFrom;
  String? streamLabel;
  String? streamUrl;
  String? thumbnailUrl;
  String? posterUrl;
  List<AllTvChannel>? allTvChannel = [];
  List<AdditionalMediaSource>? additionalMediaSource = [];
  String? currentProgramTitle;
  String? currentProgramTime;

  LiveTvDetailsModel(
      {this.liveTvId,
      this.tvName,

      this.isPaid,
      this.price,
      this.accessable,
      this.watchCount,
      this.description,
      this.slug,
      this.streamFrom,
      this.streamLabel,
      this.streamUrl,
      this.thumbnailUrl,
      this.posterUrl,
      this.allTvChannel,
      this.additionalMediaSource,
      this.currentProgramTitle,
      this.currentProgramTime});

  LiveTvDetailsModel.fromJson(Map<String, dynamic> json) {
    liveTvId = json['live_tv_id'];
    tvName = json['tv_name'];

    isPaid = json['is_paid'];
    price = json['price'];
    accessable = json['accessable'];
    watchCount = json['watch_count'];
    description = json['description'];
    slug = json['slug'];
    streamFrom = json['stream_from'];
    streamLabel = json['stream_label'];
    streamUrl = json['stream_url'];
    thumbnailUrl = json['thumbnail_url'];
    posterUrl = json['poster_url'];

    if (json['all_tv_channel'] != null) {
      var jsonList = json['all_tv_channel'] as List;
      jsonList.map((e) => AllTvChannel.fromJson(e)).toList().forEach((element) {
        allTvChannel!.add(element);
      });
    }

    if (json['additional_media_source'] != null) {
      var jsonList = json['additional_media_source'] as List;
      jsonList.map((e) => AdditionalMediaSource.fromJson(e)).toList().forEach((element) {
        additionalMediaSource!.add(element);
      });
    }


    currentProgramTitle = json['current_program_title'];
    currentProgramTime = json['current_program_time'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['live_tv_id'] = this.liveTvId;
    data['tv_name'] = this.tvName;

    data['is_paid'] = this.isPaid;
    data['price'] = this.price;
    data['accessable'] = this.accessable;
    data['watch_count'] = this.watchCount;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['stream_from'] = this.streamFrom;
    data['stream_label'] = this.streamLabel;
    data['stream_url'] = this.streamUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['poster_url'] = this.posterUrl;
    if (this.allTvChannel != null) {
      data['all_tv_channel'] =
          this.allTvChannel!.map((v) => v.toJson()).toList();
    }
    if (this.additionalMediaSource != null) {
      data['additional_media_source'] =
          this.additionalMediaSource!.map((v) => v.toJson()).toList();
    }
    data['current_program_title'] = this.currentProgramTitle;
    data['current_program_time'] = this.currentProgramTime;
    return data;
  }
}

class AllTvChannel {
  String? liveTvId;
  String? tvName;

  String? isPaid;
  String? description;
  String? slug;
  String? streamFrom;
  String? streamLabel;
  String? streamUrl;
  String? thumbnailUrl;
  String? posterUrl;

  AllTvChannel(
      {this.liveTvId,
      this.tvName,

      this.isPaid,
      this.description,
      this.slug,
      this.streamFrom,
      this.streamLabel,
      this.streamUrl,
      this.thumbnailUrl,
      this.posterUrl});

  AllTvChannel.fromJson(Map<String, dynamic> json) {
    liveTvId = json['live_tv_id'];
    tvName = json['tv_name'];

    isPaid = json['is_paid'];
    description = json['description'];
    slug = json['slug'];
    streamFrom = json['stream_from'];
    streamLabel = json['stream_label'];
    streamUrl = json['stream_url'];
    thumbnailUrl = json['thumbnail_url'];
    posterUrl = json['poster_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['live_tv_id'] = this.liveTvId;
    data['tv_name'] = this.tvName;

    data['is_paid'] = this.isPaid;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['stream_from'] = this.streamFrom;
    data['stream_label'] = this.streamLabel;
    data['stream_url'] = this.streamUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['poster_url'] = this.posterUrl;
    return data;
  }
}

class AdditionalMediaSource {
  String? live_tv_id;
  String? stream_key;
  String? source;
  String? label;
  String? url;


  AdditionalMediaSource(
      {this.live_tv_id,
        this.stream_key,
        this.source,
        this.label,
        this.url,
       });

  AdditionalMediaSource.fromJson(Map<String, dynamic> json) {
    live_tv_id = json['live_tv_id'];
    stream_key = json['stream_key'];
    source = json['source'];
    label = json['label'];
    url = json['url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['live_tv_id'] = this.live_tv_id;
    data['stream_key'] = this.stream_key;
    data['source'] = this.source;
    data['label'] = this.label;
    data['url'] = this.url;

    return data;
  }
}
