 import 'dart:convert';

CovidMyth covidMythFromJson(String str) => CovidMyth.fromJson(json.decode(str));

String covidMythToJson(CovidMyth data) => json.encode(data.toJson());

class CovidMyth {
    CovidMyth({
        this.data,
        this.total,
        this.limit,
        this.start,
        this.page,
    });

    List<Datum> data;
    int total;
    int limit;
    int start;
    int page;

    factory CovidMyth.fromJson(Map<String, dynamic> json) => CovidMyth(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
        limit: json["limit"] == null ? null : json["limit"],
        start: json["start"] == null ? null : json["start"],
        page: json["page"] == null ? null : json["page"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total == null ? null : total,
        "limit": limit == null ? null : limit,
        "start": start == null ? null : start,
        "page": page == null ? null : page,
    };
}

class Datum {
    Datum({
        this.id,
        this.type,
        this.lang,
        this.myth,
        this.mythNp,
        this.reality,
        this.realityNp,
        this.imageUrl,
        this.sourceName,
        this.sourceUrl,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    Type type;
    Lang lang;
    String myth;
    String mythNp;
    String reality;
    String realityNp;
    String imageUrl;
    String sourceName;
    String sourceUrl;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        lang: json["lang"] == null ? null : langValues.map[json["lang"]],
        myth: json["myth"] == null ? null : json["myth"],
        mythNp: json["myth_np"] == null ? null : json["myth_np"],
        reality: json["reality"] == null ? null : json["reality"],
        realityNp: json["reality_np"] == null ? null : json["reality_np"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        sourceName: json["source_name"] == null ? null : json["source_name"],
        sourceUrl: json["source_url"] == null ? null : json["source_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "type": type == null ? null : typeValues.reverse[type],
        "lang": lang == null ? null : langValues.reverse[lang],
        "myth": myth == null ? null : myth,
        "myth_np": mythNp == null ? null : mythNp,
        "reality": reality == null ? null : reality,
        "reality_np": realityNp == null ? null : realityNp,
        "image_url": imageUrl == null ? null : imageUrl,
        "source_name": sourceName == null ? null : sourceName,
        "source_url": sourceUrl == null ? null : sourceUrl,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
    };
}

enum Lang { EN, NP }

final langValues = EnumValues({
    "en": Lang.EN,
    "np": Lang.NP
});

enum Type { IMAGE, TEXT }

final typeValues = EnumValues({
    "image": Type.IMAGE,
    "text": Type.TEXT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
