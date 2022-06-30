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
  final String ans_0;
  final String ans_1;
  final String ans_2;
  final String c_ans;

  addSoal(
      {required this.soal,
      required this.ans_0,
      required this.ans_1,
      required this.ans_2,
      required this.c_ans});

  Map<String, dynamic> toJson() {
    return {"soal": soal, "ans_0": ans_0, "ans_1": ans_1, "ans_2": ans_2, "c_ans": c_ans};
  }

  factory addSoal.fromJson(Map<String, dynamic> json) {
    return addSoal(
      soal: json['soal'],
      ans_0: json['ans_0'],
      ans_1: json['ans_1'],
      ans_2: json['ans_2'],
      c_ans: json['c_ans'],
    );
  }
}

class Absen {
  final String absen;
  final String nama;
  final String mapel;

  Absen({
    required this.absen,
    required this.nama,
    required this.mapel,
  });

  Map<String, dynamic> toJson() {
    return {
      "absen": absen,
      "nama": nama,
      "mapel": mapel,
    };
  }

  factory Absen.fromJson(Map<String, dynamic> json) {
    return Absen(
      absen: json['absen'],
      nama: json['nama'],
      mapel: json['mapel'],
    );
  }
}

class Score {
  final String guru;
  final String mapel;
  final String nama;
  final String score;

  Score({
    required this.guru,
    required this.mapel,
    required this.nama,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      "guru": guru,
      "mapel": mapel,
      "nama": nama,
      "score": score,
    };
  }

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      guru: json['score'],
      mapel: json['mapel'],
      nama: json['nama'],
      score: json['score'],
    );
  }
}

class Event {
  final String title;
  final String date;
  final String name;

  Event({required this.title, required this.date, required this.name});

  Map<String, dynamic> toJson() {
    return {"title": title, "date": date, "teacher": name};
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(title: json['title'], date: json['date'], name: json['teacher']);
  }
}

class siswa {
  final String itemNama;
  final String itemKelas;
  final String itemKelamin;
  final String itemTelp;
  final String itemBirthday;

  siswa(
      {required this.itemNama,
      required this.itemKelas,
      required this.itemKelamin,
      required this.itemTelp,
      required this.itemBirthday});

  Map<String, dynamic> toJson() {
    return {
      "nama": itemNama,
      "kelas": itemKelas,
      "kelamin": itemKelamin,
      "telp": itemTelp,
      "birthday": itemBirthday,
    };
  }

  factory siswa.fromJson(Map<String, dynamic> json) {
    return siswa(
        itemNama: json['nama'],
        itemKelas: json['kelas'],
        itemKelamin: json['kelamin'],
        itemTelp: json['telp'],
        itemBirthday: json['birthday']);
  }
}

class editprofilenama {
  final String anama;
  final String aemail;

  editprofilenama({required this.anama, required this.aemail});
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson() {
    //json
    return {"nama": anama, "email": aemail};
  }

  //form TambahData
  //fromJSON
  factory editprofilenama.fromJSON(Map<String, dynamic> json) {
    return editprofilenama(anama: json['nama'], aemail: json['email']);
  }
}

class editprofileday {
  final String abirthday;
  final String aemail;

  editprofileday({required this.abirthday, required this.aemail});
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson() {
    //json
    return {"birthday": abirthday, "email": aemail};
  }

  //form TambahData
  //fromJSON
  factory editprofileday.fromJSON(Map<String, dynamic> json) {
    return editprofileday(abirthday: json['birthday'], aemail: json['email']);
  }
}

class editprofiletelp {
  final String atelp;
  final String aemail;

  editprofiletelp({required this.atelp, required this.aemail});
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson() {
    //json
    return {"telp": atelp, "email": aemail};
  }

  //form TambahData
  //fromJSON
  factory editprofiletelp.fromJSON(Map<String, dynamic> json) {
    return editprofiletelp(atelp: json['telp'], aemail: json['email']);
  }
}

class LetterGuru {
  final String judul;
  final String deskripsi;
  final String expireDate;
  final String templateImage;
  final String kelas;

  LetterGuru(
      {required this.judul,
      required this.deskripsi,
      required this.expireDate,
      required this.templateImage,
      required this.kelas});

  Map<String, dynamic> toJson() {
    return {
      "judul": judul,
      "deskripsi": deskripsi,
      "expireDate": expireDate,
      "templateImage": templateImage,
      "kelas": kelas
    };
  }

  factory LetterGuru.fromJSON(Map<String, dynamic> json) {
    return LetterGuru(
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        expireDate: json['expireDate'],
        templateImage: json['templateImage'],
        kelas: json['kelas']);
  }
}
