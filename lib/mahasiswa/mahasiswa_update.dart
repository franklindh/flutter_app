import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class updateMahasiswa extends StatefulWidget {
  const updateMahasiswa({Key? key}) : super(key: key);

  @override
  State<updateMahasiswa> createState() => _updateMahasiswaState();
}

class _updateMahasiswaState extends State<updateMahasiswa> {
  final _formKey = GlobalKey<FormState>();
  Future<List>? resp;

  TextEditingController namaController = new TextEditingController();
  TextEditingController nimController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController nimprogmobController = new TextEditingController();
  TextEditingController fotoController = new TextEditingController();

  // iniState() {
  //   namaController.text = widget.mahasiswa['nama'];
  //   nimController.text = widget.mahasiswa['nim'];
  //   emailController.text = widget.mahasiswa['email'];
  //   alamatController.text = widget.mahasiswa['alamat'];
  //   nimprogmobController.text = widget.mahasiswa['nim_progmob'];
  //   fotoController.text = widget.mahasiswa['foto'];
  //   // super.initState();
  // }

  Future<List> updateMhs(int id, String nama, String nim, String email,
      String alamat, String foto, String nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse(
          'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/update?id=$id&nim_progmob=72200407'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'nim': nim,
        'email': email,
        'alamat': alamat,
        'foto': foto,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal Menampilkan Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Mahasiswa'),
      ),
      body: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(
              hintText: 'Nama',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nimController,
            decoration: InputDecoration(
              hintText: 'Nim',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'NIM tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: alamatController,
            decoration: InputDecoration(
              hintText: 'Alamat',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Alamat tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nimprogmobController,
            decoration: InputDecoration(
              hintText: 'Nim_progmob',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nim progmob tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: fotoController,
            decoration: InputDecoration(
              hintText: 'Foto',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Foto tidak boleh kosong';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                // updateMhs(id: widget.mahasiswa['id']);
                Navigator.pop(context);
              }
            },
            child: Text('Update'),
          ),
        ]),
      ),
    );
  }
}
