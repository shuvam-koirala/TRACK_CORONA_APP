import 'dart:convert';

CovidData covidDataFromJson(String str) => CovidData.fromJson(json.decode(str));

String covidDataToJson(CovidData data) => json.encode(data.toJson());

class CovidData {
    CovidData({
        this.global,
        this.nepal,
    });

    Global global;
    Nepal nepal;

    factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        global: json["global"] == null ? null : Global.fromJson(json["global"]),
        nepal: json["nepal"] == null ? null : Nepal.fromJson(json["nepal"]),
    );

    Map<String, dynamic> toJson() => {
        "global": global == null ? null : global.toJson(),
        "nepal": nepal == null ? null : nepal.toJson(),
    };
}

class Global {
    Global({
        this.id,
        this.samplesTested,
        this.negative,
        this.positive,
        this.deaths,
        this.extra1,
        this.extra2,
        this.extra3,
        this.extra4,
        this.extra5,
        this.extra6,
        this.extra7,
        this.extra8,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    dynamic samplesTested;
    dynamic negative;
    String positive;
    String deaths;
    dynamic extra1;
    dynamic extra2;
    String extra3;
    dynamic extra4;
    dynamic extra5;
    dynamic extra6;
    dynamic extra7;
    dynamic extra8;
    int status;
    int createdBy;
    dynamic updatedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Global.fromJson(Map<String, dynamic> json) => Global(
        id: json["id"] == null ? null : json["id"],
        samplesTested: json["samples_tested"],
        negative: json["negative"],
        positive: json["positive"] == null ? null : json["positive"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        extra3: json["extra3"] == null ? null : json["extra3"],
        extra4: json["extra4"],
        extra5: json["extra5"],
        extra6: json["extra6"],
        extra7: json["extra7"],
        extra8: json["extra8"],
        status: json["status"] == null ? null : json["status"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "samples_tested": samplesTested,
        "negative": negative,
        "positive": positive == null ? null : positive,
        "deaths": deaths == null ? null : deaths,
        "extra1": extra1,
        "extra2": extra2,
        "extra3": extra3 == null ? null : extra3,
        "extra4": extra4,
        "extra5": extra5,
        "extra6": extra6,
        "extra7": extra7,
        "extra8": extra8,
        "status": status == null ? null : status,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class Nepal {
    Nepal({
        this.id,
        this.samplesTested,
        this.negative,
        this.positive,
        this.deaths,
        this.extra1,
        this.extra2,
        this.extra3,
        this.extra4,
        this.extra5,
        this.extra6,
        this.extra7,
        this.extra8,
        this.todayDeath,
        this.todayNewcase,
        this.todayRecovered,
        this.todayPcr,
        this.todayRdt,
        this.editedFlag,
        this.date,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String samplesTested;
    String negative;
    String positive;
    String deaths;
    String extra1;
    String extra2;
    dynamic extra3;
    dynamic extra4;
    String extra5;
    String extra6;
    String extra7;
    String extra8;
    String todayDeath;
    String todayNewcase;
    String todayRecovered;
    String todayPcr;
    String todayRdt;
    String editedFlag;
    DateTime date;
    int status;
    dynamic createdBy;
    int updatedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Nepal.fromJson(Map<String, dynamic> json) => Nepal(
        id: json["id"] == null ? null : json["id"],
        samplesTested: json["samples_tested"] == null ? null : json["samples_tested"],
        negative: json["negative"] == null ? null : json["negative"],
        positive: json["positive"] == null ? null : json["positive"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        extra1: json["extra1"] == null ? null : json["extra1"],
        extra2: json["extra2"] == null ? null : json["extra2"],
        extra3: json["extra3"],
        extra4: json["extra4"],
        extra5: json["extra5"] == null ? null : json["extra5"],
        extra6: json["extra6"] == null ? null : json["extra6"],
        extra7: json["extra7"] == null ? null : json["extra7"],
        extra8: json["extra8"] == null ? null : json["extra8"],
        todayDeath: json["today_death"] == null ? null : json["today_death"],
        todayNewcase: json["today_newcase"] == null ? null : json["today_newcase"],
        todayRecovered: json["today_recovered"] == null ? null : json["today_recovered"],
        todayPcr: json["today_pcr"] == null ? null : json["today_pcr"],
        todayRdt: json["today_rdt"] == null ? null : json["today_rdt"],
        editedFlag: json["edited_flag"] == null ? null : json["edited_flag"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"] == null ? null : json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "samples_tested": samplesTested == null ? null : samplesTested,
        "negative": negative == null ? null : negative,
        "positive": positive == null ? null : positive,
        "deaths": deaths == null ? null : deaths,
        "extra1": extra1 == null ? null : extra1,
        "extra2": extra2 == null ? null : extra2,
        "extra3": extra3,
        "extra4": extra4,
        "extra5": extra5 == null ? null : extra5,
        "extra6": extra6 == null ? null : extra6,
        "extra7": extra7 == null ? null : extra7,
        "extra8": extra8 == null ? null : extra8,
        "today_death": todayDeath == null ? null : todayDeath,
        "today_newcase": todayNewcase == null ? null : todayNewcase,
        "today_recovered": todayRecovered == null ? null : todayRecovered,
        "today_pcr": todayPcr == null ? null : todayPcr,
        "today_rdt": todayRdt == null ? null : todayRdt,
        "edited_flag": editedFlag == null ? null : editedFlag,
        "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status == null ? null : status,
        "created_by": createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
