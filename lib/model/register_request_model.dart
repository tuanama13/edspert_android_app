// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  String? namaLengkap;
  String? email;
  String? namaSekolah;
  String? kelas;
  String? gender;
  String? foto;
  String? jenjang;

  RegisterRequest({
    this.namaLengkap,
    this.email,
    this.namaSekolah,
    this.kelas,
    this.gender,
    this.foto,
    this.jenjang,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        namaSekolah: json["nama_sekolah"],
        kelas: json["kelas"],
        gender: json["gender"],
        foto: json["foto"],
        jenjang: json["jenjang"],
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "email": email,
        "nama_sekolah": namaSekolah,
        "kelas": kelas,
        "gender": gender,
        "foto": foto,
        "jenjang": jenjang,
      };
}
