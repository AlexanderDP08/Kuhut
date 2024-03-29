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
  final String namaGuru;

  addSoal(
      {required this.soal,
      required this.ansA,
      required this.ansB,
      required this.ansC,
      required this.righAns,
      required this.namaGuru});

  Map<String, dynamic> toJson() {
    return {
      "soal": soal,
      "ans_0": ansA,
      "ans_1": ansB,
      "ans_2": ansC,
      "c_ans": righAns,
      "guru": namaGuru
    };
  }

  factory addSoal.fromJson(Map<String, dynamic> json) {
    return addSoal(
      soal: json['soal'],
      ansA: json['ans_0'],
      ansB: json['ans_1'],
      ansC: json['ans_2'],
      righAns: json['c_ans'],
      namaGuru: json['guru'],
    );
  }
}

class Absen {
  final String absen;
  final String nama;
  final String namaGuru;
  final String mapel;

  Absen({
    required this.absen,
    required this.nama,
    required this.namaGuru,
    required this.mapel,
  });

  Map<String, dynamic> toJson() {
    return {
      "absen": absen,
      "nama": nama,
      "namaGuru": namaGuru,
      "mapel": mapel,
    };
  }

  factory Absen.fromJson(Map<String, dynamic> json) {
    return Absen(
      absen: json['absen'],
      nama: json['nama'],
      namaGuru: json['namaGuru'],
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
  final String jenjang;

  Event(
      {required this.title,
      required this.date,
      required this.name,
      required this.jenjang});

  Map<String, dynamic> toJson() {
    return {"title": title, "date": date, "teacher": name, "jenjang": jenjang};
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        title: json['title'],
        date: json['date'],
        name: json['teacher'],
        jenjang: json['jenjang']);
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

class editprofilenilai {
  final String anilai;
  final String anama;
  final String atitle;
  final String aemailguru;

  editprofilenilai(
      {required this.anilai,
      required this.anama,
      required this.atitle,
      required this.aemailguru});
  //toJSON, or toDataClass Firebase
  Map<String, dynamic> toJson() {
    //json
    return {
      "score": anilai,
      "nama": anama,
      "mapel": atitle,
      "email": aemailguru
    };
  }

  //form TambahData
  //fromJSON
  factory editprofilenilai.fromJSON(Map<String, dynamic> json) {
    return editprofilenilai(
        anilai: json['score'],
        anama: json['nama'],
        atitle: json['mapel'],
        aemailguru: json['email']);
  }
}

class LetterGuru {
  final String judul;
  final String deskripsi;
  final String expireDate;
  final String templateImage;
  final String kelas;
  final String expireDateFormatted;

  LetterGuru(
      {required this.judul,
      required this.deskripsi,
      required this.expireDate,
      required this.templateImage,
      required this.kelas,
      required this.expireDateFormatted});

  Map<String, dynamic> toJson() {
    return {
      "judul": judul,
      "deskripsi": deskripsi,
      "expireDate": expireDate,
      "templateImage": templateImage,
      "kelas": kelas,
      "expiredDateForamtted": expireDateFormatted
    };
  }

  factory LetterGuru.fromJSON(Map<String, dynamic> json) {
    return LetterGuru(
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        expireDate: json['expireDate'],
        templateImage: json['templateImage'],
        kelas: json['kelas'],
        expireDateFormatted: json['expireDateFormatted']);
  }
}

class addJawabanSiswa {
  final String jawabanSiswa;
  final String namaSiswa;
  final String namaSoal;
  final String soal;

  addJawabanSiswa(
      {required this.jawabanSiswa,
      required this.namaSiswa,
      required this.namaSoal,
      required this.soal});

  Map<String, dynamic> toJson() {
    return {
      "jawaban_siswa": jawabanSiswa,
      "nama_siswa": namaSiswa,
      "nama_soal": namaSoal,
      "soal": soal
    };
  }

  factory addJawabanSiswa.fromJSON(Map<String, dynamic> json) {
    return addJawabanSiswa(
        jawabanSiswa: json['jawaban_siswa'],
        namaSiswa: json['nama_siswa'],
        namaSoal: json['nama_soal'],
        soal: json['soal']);
  }
}
