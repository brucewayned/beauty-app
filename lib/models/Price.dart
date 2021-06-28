class Price {
  Price(
      this.normal,
      this.special,
      this.percent,
      this.endTime
      );

  double normal=0;
  double special=0;
  double percent=0;
  String endTime='';

  static DefaultInstance(){
    return new Price(0, 0, 0, '');
  }

  Price.fromJson(Map<String, dynamic> json) {
    normal = (json['normal'] != null ? json['normal'] : 0);
    special = (json['special'] != null ? json['special'] : 0);
    percent = (json['percent'] != null ? json['percent'] : 0);
    endTime = (json['endTime'] != null ? json['endTime'] : '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['normal'] = this.normal;
    data['special'] = this.special;
    data['percent'] = this.percent;
    data['end_time'] = this.endTime;
    return data;
  }
}