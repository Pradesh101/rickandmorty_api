import 'package:flutter/material.dart';
import 'package:rickandmorty_api/models/rickmorty_model.dart';
import 'package:rickandmorty_api/screens/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final RickMortyModel rmm;
  const DetailScreen({Key? key, required this.rmm}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var dList = Idholder.allDetail;
  int? fId = Idholder.firstId;
  int? lId = Idholder.lastId;
  int? cId = Idholder.currentId;

  @override
  void initState() {
    super.initState();
    //epList.addAll(widget.rmm.episode);
    // fId = widget.rmm.id;
    // print(fId);
    // print(lId);
    // print(cId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rmm.name),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.navigate_before),
                  onPressed: () {},
                ),
                const Text('Previous')
              ],
            ),
            Row(
              children: [
                const Text('Next'),
                IconButton(
                  icon: const Icon(Icons.navigate_next),
                  onPressed: () {
                    setState(() {
                      //cId++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 250,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Hero(
                      tag: widget.rmm.id,
                      child: Image.network(widget.rmm.image)),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${widget.rmm.name}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Status: ${widget.rmm.status}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Species: ${widget.rmm.species}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Type: ${widget.rmm.type}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Gender: ${widget.rmm.gender}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Origin name: ${widget.rmm.origin.name}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Origin url: ${widget.rmm.origin.url}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Location name: ${widget.rmm.location.name}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Location url: ${widget.rmm.location.url}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // getEpisodeList(),
                  Text(
                    'Episode: ${widget.rmm.episode.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Url: ${widget.rmm.url}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Created: ${widget.rmm.created}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
