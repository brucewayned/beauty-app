class Thumbnail {
  String imgUrl='';

  Thumbnail({required this.imgUrl});

  static DefaultInstance(){
    return new Thumbnail(imgUrl: '');
  }

  Thumbnail.fromJson(Map<String, dynamic> json) {
    imgUrl = (json['img_url'] != null ? json['img_url'] : '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_url'] = this.imgUrl;
    return data;
  }
}