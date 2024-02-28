import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    AppBar appBar = AppBar(
      toolbarHeight: 70.0,
      title: Text(
        "Movie Reviews",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
    );
    // 화면에 보이는 영역
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                hintText: '영화 제목을 입력하세요.',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return movieItem(data: dataList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class movieItem extends StatelessWidget {
  const movieItem({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Card(
              //semanticContainer: true,
              child: Image.network(
                data["imgUrl"],
                height: double.infinity,
                fit: BoxFit.fill,
                color: Color.fromRGBO(100, 100, 100, 1.0),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          SizedBox(
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                    data["category"],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
