class Picture {
  String imgUrl='';

  Picture({required this.imgUrl});

  static DefaultInstance(){
    return new Picture(imgUrl: '');
  }

  Picture.fromJson(Map<String, dynamic> json) {
    imgUrl = (json['img_url'] != null ? json['img_url'] : '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_url'] = this.imgUrl;
    return data;
  }
}