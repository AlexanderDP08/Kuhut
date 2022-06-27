class Login {
  final String email;
  final String password;

  Login({required this.email, required this.password});
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson() {
    //json
    return {"email": email, "password": password};
  }

  //form TambahData
  //fromJSON
  factory Login.fromJSON(Map<String, dynamic> json) {
    return Login(email: json['email'], password: json['password']);
  }
}

class addSoal {
  final String soal;
  final String ansA;
  final String ansB;
  final String ansC;
  final String righAns;

  addSoal(
      {required this.soal,
      required this.ansA,
      required this.ansB,
      required this.ansC,
      required this.righAns});

  Map<String, dynamic> toJson() {
    return {
      "soal": soal,
      "ansA": ansA,
      "ansB": ansB,
      "ansC": ansC,
      "rightAns": righAns
    };
  }

  factory addSoal.fromJson(Map<String, dynamic> json) {
    return addSoal(
        soal: json['soal'],
        ansA: json['ansA'],
        ansB: json['ansB'],
        ansC: json['ansC'],
        righAns: json['rightAns']);
  }
}

class Event {
  final String title;
  final String date;

  Event({required this.title, required this.date});

  Map<String, dynamic> toJson() {
    return {"title": title, "date": date};
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(title: json['title'], date: json['date']);
  }

  // String toString() => title;
}
