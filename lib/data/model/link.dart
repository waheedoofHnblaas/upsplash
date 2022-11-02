// class Links {
//   String? self;
//   String? html;
//   String? download;
//   String? downloadLocation;
//
//   Links({this.self, this.html, this.download, this.downloadLocation});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     self = json['self'];
//     html = json['html'];
//     download = json['download'];
//     downloadLocation = json['download_location'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['self'] = this.self;
//     data['html'] = this.html;
//     data['download'] = this.download;
//     data['download_location'] = this.downloadLocation;
//     return data;
//   }
// }