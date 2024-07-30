import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class WeatherListItem {
  final double temprature;
  final String sky;
  final DateTime time;

  WeatherListItem({
    required this.temprature,
    required this.sky,
    required this.time,
  });

  WeatherListItem copyWith({
    double? temprature,
    String? sky,
    DateTime? time,
  }) {
    return WeatherListItem(
      temprature: temprature ?? this.temprature,
      sky: sky ?? this.sky,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temprature': temprature,
      'sky': sky,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory WeatherListItem.fromMap(Map<String, dynamic> map) {
    return WeatherListItem(
      temprature: map['temprature'] as double,
      sky: map['sky'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherListItem.fromJson(String source) =>
      WeatherListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeatherListItem(temprature: $temprature, sky: $sky, time: $time)';

  @override
  bool operator ==(covariant WeatherListItem other) {
    if (identical(this, other)) return true;

    return other.temprature == temprature &&
        other.sky == sky &&
        other.time == time;
  }

  @override
  int get hashCode => temprature.hashCode ^ sky.hashCode ^ time.hashCode;
}
