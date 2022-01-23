// To parse this JSON data, do
//
//     final covidNews = covidNewsFromJson(jsonString);

import 'dart:convert';

CovidNews covidNewsFromJson(String str) => CovidNews.fromJson(json.decode(str));

String covidNewsToJson(CovidNews data) => json.encode(data.toJson());

class CovidNews {
    CovidNews({
        this.total,
        this.items,
    });

    int total;
    List<News> items;

    factory CovidNews.fromJson(Map<String, dynamic> json) => CovidNews(
        total: json["total"] == null ? null : json["total"],
        items: json["items"] == null ? null : List<News>.from(json["items"].map((x) => News.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class News {
    News({
        this.nid,
        this.title,
        this.description,
        this.content,
        this.author,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.addedOn,
        this.siteName,
        this.language,
        this.countryCode,
        this.status,
    });

    int nid;
    String title;
    String description;
    String content;
    String author;
    String url;
    String urlToImage;
    DateTime publishedAt;
    DateTime addedOn;
    String siteName;
    String language;
    String countryCode;
    int status;

    factory News.fromJson(Map<String, dynamic> json) => News(
        nid: json["nid"] == null ? null : json["nid"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        author: json["author"] == null ? null : json["author"],
        url: json["url"] == null ? null : json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        addedOn: json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
        siteName: json["siteName"] == null ? null : json["siteName"],
        language: json["language"] == null ? null : json["language"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "nid": nid == null ? null : nid,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "author": author == null ? null : author,
        "url": url == null ? null : url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
        "addedOn": addedOn == null ? null : addedOn.toIso8601String(),
        "siteName": siteName == null ? null : siteName,
        "language": language == null ? null : language,
        "countryCode": countryCode == null ? null : countryCode,
        "status": status == null ? null : status,
    };
}
