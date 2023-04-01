import 'package:fl_chart/fl_chart.dart';

class AssetStatusTrendModel {
  String? account;
  List<Trend>? trend;

  AssetStatusTrendModel({
    this.account,
    this.trend,
  });
  double maxX = double.minPositive,
      minX = double.maxFinite,
      maxY = double.minPositive,
      minY = double.maxFinite;

  AssetStatusTrendModel.fromJson(Map<String, dynamic> json) {
    if (json["account"] is String) {
      account = json["account"];
    }
    if (json["trend"] is List) {
      trend = json["trend"] == null
          ? null
          : (json["trend"] as List).map((e) => Trend.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["account"] = account;

    if (trend != null) {
      data["trend"] = trend?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  List<FlSpot>? toSpot() => trend?.map((e) {
        final x = DateTime.parse(e.date!).millisecondsSinceEpoch / 100000;
        final y = e.asset!.toDouble();

        if (maxX < x) {
          maxX = x;
        }
        if (minX > x) {
          minX = x;
        }
        if (maxY < y) {
          maxY = y;
        }
        if (minY > y) {
          minY = y;
        }
        return FlSpot(
          x,
          y,
        );
      }).toList();
}

class Trend {
  String? date;
  int? ticks;
  int? asset;

  Trend({
    this.date,
    this.ticks,
    this.asset,
  });

  Trend.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["ticks"] is int) {
      ticks = json["ticks"];
    }
    if (json["asset"] is int) {
      asset = json["asset"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["date"] = date;
    data["ticks"] = ticks;
    data["asset"] = asset;

    return data;
  }
}
