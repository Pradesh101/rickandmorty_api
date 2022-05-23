import 'package:flutter/material.dart';
import 'package:rickandmorty_api/models/rickmorty_model.dart';
import 'package:rickandmorty_api/screens/detail_screen.dart';
import 'package:rickandmorty_api/services/rickmorty_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RickMortyModel> rmList = [];
  int pageNo = 1;

  fetchRickAndMortyData() {
    RickMortyService().fetchRickMortyData(pageNo).then((value) {
      setState(() {
        rmList = value;
        Idholder.allDetail = rmList;
        Idholder.firstId = rmList.first.id;
        Idholder.lastId = rmList.last.id;
        // print(Idholder.firstId);
        // print(Idholder.lastId);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRickAndMortyData();
  }

  @override
  Widget build(BuildContext context) {
    //print(rmList);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick & Morty Show',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: rmList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 5, mainAxisSpacing: 5
                ),
                itemBuilder: (context, index) {
                  RickMortyModel data = rmList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Idholder.currentId = data.id;
                        // print(Idholder.currentId);
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          rmm: data,
                        );
                      }));
                    },
                    child: Hero(
                      tag: data.id,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: NetworkImage(data.image),
                                    fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    pageNo--;
                    if (pageNo == 0) {
                      pageNo++;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('No more data available'),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      fetchRickAndMortyData();
                      //print(pageNo);
                    }
                  });
                },
                icon: const Icon(Icons.navigate_before),
                label: const Text('Previous'),
                //child: const Text('Previous')
              ),
              Text('Page no: $pageNo'),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    pageNo++;
                    if (pageNo == 43) {
                      pageNo--;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('No more data available'),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      fetchRickAndMortyData();
                      // print(pageNo);
                    }
                  });
                },
                label: const Text('Next'),
                icon: const Icon(Icons.navigate_next),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Idholder {
  static int? firstId;
  static int? lastId;
  static int? currentId;
  static var allDetail = [];
}
