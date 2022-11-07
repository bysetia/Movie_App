import 'package:flutter/material.dart';

class ListSiswa extends StatefulWidget {
  const ListSiswa({Key? key}) : super(key: key);

  @override
  State<ListSiswa> createState() => _ListSiswaState();
}

class _ListSiswaState extends State<ListSiswa> {
  List<User> users = [
    User(
        name: 'Adhanafi ilyasa Sutejo',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 01",
        image: 'image/pp.jpeg'),
    User(
        name: 'Ahmad Aziz Wira Widodo',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 02",
        image: 'image/pp.jpeg'),
    User(
        name: 'Akbar Risqullah Putra Susanto',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 03",
        image: 'image/pp.jpeg'),
    User(
        name: 'Alwan Athallah Mumtaz',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 04",
        image: 'image/pp.jpeg'),
    User(
        name: 'Amri iqro Samudra Al-Fatihah',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 05",
        image: 'image/pp.jpeg'),
    User(
        name: 'Anakku Lanang Sejati Adli',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 06",
        image: 'image/pp.jpeg'),
    User(
        name: 'Andika Setya Eka Natha',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 07",
        image: 'image/pp.jpeg'),
    User(
        name: 'Antariksa Kusuma Hermawan',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 08",
        image: 'image/pp.jpeg'),
    User(
        name: 'Azzra Rienov Fahlivi',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 09",
        image: 'image/pp.jpeg'),
    User(
        name: 'Bayu Septian Kurniawan',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 10",
        image: 'image/profil.jpeg'),
    User(
        name: 'Bhre Nabil Faeyza',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 11",
        image: 'image/user.jpeg'),
    User(
        name: 'Bimo Adi Bramantyo',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 12",
        image: 'image/user.jpeg'),
    User(
        name: 'Daffa Syauqi Syarif',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 13",
        image: 'image/user.jpeg'),
    User(
        name: 'Danar Gading',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 14",
        image: 'image/user.jpeg'),
    User(
        name: 'Dimas Bagus Adityas',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 15",
        image: 'image/user.jpeg'),
    User(
        name: 'Firdaus Hafidz Al-Kaff',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 16",
        image: 'image/user.jpeg'),
    User(
        name: 'Hegel Al-Rafli',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 17",
        image: 'image/user.jpeg'),
    User(
        name: 'Hibatullah Fawwaz Hana',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 18",
        image: 'image/user.jpeg'),
    User(
        name: 'Javier Gavra Abhinaya',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 19",
        image: 'image/user.jpeg'),
    User(
        name: 'Khoiru Rizal Kalam Ismail',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 20",
        image: 'image/user.jpeg'),
    User(
        name: 'Lugas Richtigo Kalam Hetami',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 21",
        image: 'image/user.jpeg'),
    User(
        name: 'Meyssa Aqila Adikara',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 22",
        image: 'image/user.jpeg'),
    User(
        name: 'Mikhail Haqeen',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 23",
        image: 'image/user.jpeg'),
    User(
        name: 'Muh Wahyu Ageng Pambudi',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 24",
        image: 'image/user.jpeg'),
    User(
        name: 'Muhammad Firdan Azhari',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 25",
        image: 'image/user.jpeg'),
    User(
        name: 'Muhammad Nur Wahid Bimawan',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 26",
        image: 'image/user.jpeg'),
    User(
        name: 'Muhammad Vitto Corleone',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 27",
        image: 'image/user.jpeg'),
    User(
        name: 'Muhammad Zumar Ramadhan',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 28",
        image: 'image/user.jpeg'),
    User(
        name: 'Nabil Rajankanz',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 29",
        image: 'image/user.jpeg'),
    User(
        name: 'Nadhif Ariq Danendra',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 30",
        image: 'image/user.jpeg'),
    User(
        name: 'Riko Aditya Zaki',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 31",
        image: 'image/user.jpeg'),
    User(
        name: 'Rizqi Agung Pradana',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 32",
        image: 'image/user.jpeg'),
    User(
        name: 'Sinatrya Rasyid Fawwaz',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 33",
        image: 'image/user.jpeg'),
    User(
        name: 'Wulan Febrianti',
        kelas: 'Kelas: 11 PPLG 1 || ',
        absen: "Absen: 34",
        image: 'image/user.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final User list = users[index];
            return Card(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: ListTile(
                  onLongPress: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Hapus Item'),
                        content: const Text('Tekan Ok untuk Menghapus'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'ok');
                              setState(() {
                                users.remove(list);
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(list.image),
                  ),
                  title: Text(list.name),
                  subtitle: Text(list.kelas + list.absen),
                ),
              ),
            );
          }),
    );
  }
}

class User {
  String name, kelas, absen, image;
  User(
      {required this.name,
      required this.kelas,
      required this.absen,
      required this.image});
}
