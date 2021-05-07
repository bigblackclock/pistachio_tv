import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:pistachio_tv/models/models.dart';

class Channel extends ParseObject implements ParseCloneable {
  Channel({this.title = '', this.logo = '', this.channelUrls = const []})
      : super(_keyTableName);
  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      title: map['title'],
      logo: map['logo'],
      channelUrls:
          List.from(map['urls']).map((e) => ChannelUrl.fromMap(e)).toList(),
    );
  }
  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source));
  Channel.clone() : this();
  final String title;
  final String logo;
  final List<ChannelUrl>? channelUrls;

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  Channel clone(Map map) =>
      Channel.clone()..fromJson(map as Map<String, dynamic>);

  static const String _keyTableName = 'channels';
  static const String keyName = 'Name';

  String get name => get(keyName);
  set name(String name) => set<String>(keyName, name);

  Future<List<Channel>> getAllChannels() async {
    final QueryBuilder query = QueryBuilder<Channel>(Channel())..setLimit(380);
    try {
      var res = await query.query();
      return res.results!.map((e) => Channel.fromJson(e.toString())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
