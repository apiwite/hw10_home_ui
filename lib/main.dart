import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'ui_test.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoupterSatainwza.com',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<ui_test> UIList = [
    ui_test(imguser: 'assets/images/profile_cat.jpg', img: 'assets/images/cat_profile.jpg',
      userpost: 'maruay', comments: [Comments(user: 'cat_lover', comment: 'so cute :]'),],
      caption: 'smile :] \n#niceday',),
    ui_test(imguser: 'assets/images/profile_face.jpg', img: 'assets/images/feed_food.jpg',
        userpost: 'muffins',comments: [Comments(user: 'apiwit', comment: '👍👍so hungry👍👍'),Comments(user: 'zank', comment: 'see you tmr'),Comments(user: 'arm', comment: 'awwwww')],
        caption: 'ma kin daui gun mai    #mukatakunmai'),
    ui_test(imguser: 'assets/images/profile_rac.jpg', img: 'assets/images/feed_food2.jpg',
        userpost: 'forWhat',comments: [Comments(user: 'muffins', comment: 'na kin mak')],
        caption: '#breakfast #food'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('SoupterSatainwza.com',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.normal,
            fontSize: 25.0, color: Colors.white))),
      body: ListView.builder(
          itemCount: UIList.length,
          itemBuilder: (context, index) =>
              MyCard(UI: UIList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final ui_test UI;

  const MyCard({
    Key? key,
    required this.UI,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.UI.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.UI.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.UI.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.UI.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.UI.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.UI.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.UI.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.UI.comments.add(Comments(user: 'Me', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}