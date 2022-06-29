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

class siswa{
  final String itemNama;
  final String itemKelas;
  final String itemKelamin;
  final String itemTelp;
  final String itemBirthday;

  siswa({required this.itemNama,required this.itemKelas,required this.itemKelamin,required this.itemTelp,required this.itemBirthday});

  Map<String, dynamic> toJson(){
    return {
      "nama" : itemNama,
      "kelas" : itemKelas,
      "kelamin" : itemKelamin,
      "telp" : itemTelp,
      "birthday" : itemBirthday,
    };
  }

  factory siswa.fromJson(Map<String, dynamic> json){
    return siswa(
      itemNama: json['nama'],
      itemKelas: json['kelas'],
      itemKelamin: json['kelamin'],
      itemTelp: json['telp'],
      itemBirthday: json['birthday']
    );
  }
}

class LetterGuru{
  final String judul;
  final String deskripsi;
  final String expireDate; 
  final String templateImage;
  final String kelas;


  LetterGuru({
    required this.judul, required this.deskripsi, required this.expireDate, required this.templateImage, required this.kelas
  });

  Map<String, dynamic> toJson(){
    return {
      "judul" : judul,
      "deskripsi" : deskripsi,
      "expireDate" : expireDate,
      "templateImage" : templateImage,
      "kelas" : kelas
    };
  }
  
  factory LetterGuru.fromJSON(Map<String, dynamic> json){
    return LetterGuru(judul: json['judul'], deskripsi: json['deskripsi'], expireDate: json['expireDate'], templateImage: json['templateImage'], kelas: json['kelas']);
  }
}
