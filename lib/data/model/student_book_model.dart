class StudentBookModel {
  String? bOOKID;
  String? uSERTYPE;
  String? bOOKTYPE;
  String? tITLE;
  String? yEAROF;
  String? fILENAME;
  String? cREATEDAT;

  StudentBookModel(
      {this.bOOKID,
        this.uSERTYPE,
        this.bOOKTYPE,
        this.tITLE,
        this.yEAROF,
        this.fILENAME,
        this.cREATEDAT});

  StudentBookModel.fromJson(Map<String, dynamic> json) {
    bOOKID = json['BOOK_ID'];
    uSERTYPE = json['USER_TYPE'];
    bOOKTYPE = json['BOOK_TYPE'];
    tITLE = json['TITLE'];
    yEAROF = json['YEAR_OF'];
    fILENAME = json['FILE_NAME'];
    cREATEDAT = json['CREATED_AT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BOOK_ID'] = this.bOOKID;
    data['USER_TYPE'] = this.uSERTYPE;
    data['BOOK_TYPE'] = this.bOOKTYPE;
    data['TITLE'] = this.tITLE;
    data['YEAR_OF'] = this.yEAROF;
    data['FILE_NAME'] = this.fILENAME;
    data['CREATED_AT'] = this.cREATEDAT;
    return data;
  }
}