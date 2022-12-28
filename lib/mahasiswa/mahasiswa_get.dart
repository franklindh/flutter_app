import 'package:flutter/material.dart';
import 'package:flutter_app/mahasiswa/mahasiswa_update.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/mahasiswa/mahasiswa_add.dart';
import 'package:flutter_app/mahasiswa/mahasiswa_update.dart';
import 'package:snapshot/snapshot.dart';

class getMahasiswa extends StatefulWidget {
  const getMahasiswa({Key? key}) : super(key: key);

  @override
  State<getMahasiswa> createState() => _getMahasiswaState();
}

class _getMahasiswaState extends State<getMahasiswa> {
  List _get = [];

  Future _getDataMhs() async {
    try {
      final response = await http.get(
          Uri.parse("https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200407"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      }
    } catch (e) {}
  }

  Future _delMhs(String id, nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nim_progmob': nim_progmob,
      }),
    );
    if (response.statusCode == 200) {
      _get.clear();
      _getDataMhs();
    } else {
      // throw Exception('Gagal Menghapus Data');
      print(id);
    }
  }

  // Future _updateMhs()

  @override
  void initState() {
    super.initState();
    _getDataMhs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa'),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text(_get[index]['nama']),
                    subtitle: Text(_get[index]['nim']),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Edit'),
                          value: 'update',
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => updateMahasiswa()),
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'delete',
                          onTap: () async {
                            _delMhs(_get[index]['id'].toString(), '72200407');
                          },
                        ),
                      ],
                    )),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addMahasiswa()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
