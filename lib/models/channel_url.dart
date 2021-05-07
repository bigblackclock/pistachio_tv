import 'dart:convert';

class ChannelUrl {
  ChannelUrl({
    this.url,
    this.isOk,
  });
  factory ChannelUrl.fromMap(Map<String, dynamic> map) {
    return ChannelUrl(
      url: map['url'] as String,
      isOk: map['isOk'] as bool,
    );
  }

  factory ChannelUrl.fromJson(String source) =>
      ChannelUrl.fromMap(json.decode(source));

  final String? url;
  final bool? isOk;
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'isOk': isOk,
    };
  }
}
