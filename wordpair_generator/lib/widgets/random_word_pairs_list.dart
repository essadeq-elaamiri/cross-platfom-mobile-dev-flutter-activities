import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsList extends StatefulWidget {
  @override
  RandomWordsListState createState() {
    return RandomWordsListState();
  }
}

class RandomWordsListState extends State<RandomWordsList> {
  // the '_' means private variable
  final _randomWordsPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  // private function
  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, item) {
        //if (item.isOdd) return Divider();
        final index = item ~/ 2;
        if (index >= _randomWordsPairs.length) {
          //generate more wordPairs
          _randomWordsPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordsPairs[index]);
      }, // function itemBulder
    );
  }

  // private function
  Widget _buildRow(WordPair wordPair) {
    final _isAlreadySaved = _savedWordPairs.contains(wordPair);
    return Card(
      child: ListTile(
        title: Text(
          wordPair.asPascalCase,
          style: TextStyle(
              fontSize: 15.8,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold),
        ),
        trailing: Icon(_isAlreadySaved ? Icons.favorite : Icons.favorite_border,
            color: _isAlreadySaved ? Colors.red : null),
        onTap: () {
          // click lintener
          setState(() {
            if (_isAlreadySaved) {
              _savedWordPairs.remove(wordPair);
            } else {
              _savedWordPairs.add(wordPair);
            }
          });
        },
      ),
    );
  }

  void _showSaved() {
    // navigate to a differente route
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      // creating a list of our saved wordPairs
      final Iterable<ListTile> _listTiels =
          _savedWordPairs.map((WordPair wordP) {
        return ListTile(
          title: Text(
            wordP.asPascalCase,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          tileColor: Colors.red,
          textColor: Colors.white,
        );
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: _listTiels).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Your Favourit wordPairs"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WordsPair Generator"),
        actions: [IconButton(onPressed: _showSaved, icon: Icon(Icons.list))],
      ),
      body: _buildListView(),
    );
  }
}
