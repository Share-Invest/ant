import 'package:fl_chart/fl_chart.dart';

class AssetChartModel {
  List<Previous>? previous;
  List<Present>? present;
  int? minX;
  int? maxX;
  int? minY;
  int? maxY;

  AssetChartModel({
    this.previous,
    this.present,
    this.minX,
    this.maxX,
    this.minY,
    this.maxY,
  });
  List<FlSpot>? toPreviousSpot() => previous!
      .map((e) => FlSpot(
            e.index!.toDouble(),
            e.asset!.toDouble(),
          ))
      .toList();

  List<FlSpot>? toPresentSpot() => present!
      .map((e) => FlSpot(
            e.index!.toDouble(),
            e.asset!.toDouble(),
          ))
      .toList();

  AssetChartModel.fromJson(Map<String, dynamic> json) {
    if (json["previous"] is List) {
      previous = json["previous"] == null
          ? null
          : (json["previous"] as List)
              .map((e) => Previous.fromJson(e))
              .toList();
    }
    if (json["present"] is List) {
      present = json["present"] == null
          ? null
          : (json["present"] as List).map((e) => Present.fromJson(e)).toList();
    }
    if (json["minX"] is int) {
      minX = json["minX"];
    }
    if (json["maxX"] is int) {
      maxX = json["maxX"];
    }
    if (json["minY"] is int) {
      minY = json["minY"];
    }
    if (json["maxY"] is int) {
      maxY = json["maxY"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (previous != null) {
      data["previous"] = previous?.map((e) => e.toJson()).toList();
    }
    if (present != null) {
      data["present"] = present?.map((e) => e.toJson()).toList();
    }
    data["minX"] = minX;
    data["maxX"] = maxX;
    data["minY"] = minY;
    data["maxY"] = maxY;

    return data;
  }
}

class Present {
  String? date;
  int? index;
  int? asset;

  Present({
    this.date,
    this.index,
    this.asset,
  });

  Present.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["index"] is int) {
      index = json["index"];
    }
    if (json["asset"] is int) {
      asset = json["asset"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["date"] = date;
    data["index"] = index;
    data["asset"] = asset;

    return data;
  }
}

class Previous {
  String? date;
  int? index;
  int? asset;

  Previous({
    this.date,
    this.index,
    this.asset,
  });

  Previous.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["index"] is int) {
      index = json["index"];
    }
    if (json["asset"] is int) {
      asset = json["asset"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["date"] = date;
    data["index"] = index;
    data["asset"] = asset;

    return data;
  }
}
