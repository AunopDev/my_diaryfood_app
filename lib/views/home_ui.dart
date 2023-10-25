import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:my_diaryfood_app/services/call_api.dart';
import 'package:my_diaryfood_app/views/add_diaryfood.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรที่เก็บข้อมูลจากการเรียกใช้ API
  Future<List<Diaryfood>>? diaryfoodData;

  // สร้างเมธอดที่เรียกใช้ API
  getAllDiaryfood() {
    setState(() {
      diaryfoodData = CallApi.callAPIGetAllDiaryfood();
    });
  }

  @override
  void initState() {
    getAllDiaryfood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My Diary Food',
          style: GoogleFonts.itim(),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // เปิดไปหน้า AddDiaryfoodUI แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDairyfoodUI(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            // แสดงรูปที่เตรียมไว้
            Image.asset(
              'assets/images/banner.jpg',
              fit: BoxFit.cover,
            ),
            // แสดงข้อมูลรายการกินที่ Get มาจาก Database ที่ Server ในรูปของ ListView
            Expanded(
              child: FutureBuilder(
                future: CallApi.callAPIGetAllDiaryfood(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    // เอาข้อมูลใส่ ListView โดยการตรวจสอบ massage
                    if(snapshot.data[0].massage == '0'){
                      return Center(
                        child: Text(
                          'ยังไม่มีข้อมูล',
                          style: GoogleFonts.itim(),
                        ),
                      );
                    }else{
                      return ListView.builder(
                        // นับจำนวนข้อมูลทีจะแสดงใน ListView
                        itemCount: snapshot.data.lenght,
                        // Layout ของ ListView ที่จะนำข้อมูลมาแสดง
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(
                              snapshot.data[index].foodShopname,
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                          'มีข้อผิดพลาดเกิดขึ้น',
                          style: GoogleFonts.itim(),
                        ),
                      );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
