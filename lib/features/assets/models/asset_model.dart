class AssetModel {
  List<Account>? account;
  int? total;

  AssetModel({
    this.account,
    this.total,
  });
  AssetModel.fromJson(Map<String, dynamic> json) {
    if (json["each"] is List) {
      account = json["each"] == null
          ? null
          : (json["each"] as List).map((e) => Account.fromJson(e)).toList();
    }
    if (json["total"] is int) {
      total = json["total"];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (account != null) {
      data["each"] = account?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;

    return data;
  }
}

class Account {
  String? acc;
  String? date;
  int? asset;

  Account({
    this.acc,
    this.date,
    this.asset,
  });
  Account.fromJson(Map<String, dynamic> json) {
    if (json["acc"] is String) {
      acc = json["acc"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["asset"] is int) {
      asset = json["asset"];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["acc"] = acc;
    data["date"] = date;
    data["asset"] = asset;

    return data;
  }
}
