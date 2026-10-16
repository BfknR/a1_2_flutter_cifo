import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class PeopleList extends StatefulWidget {
  const new({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _randomNames = RandomNames(Zone.catalonia);
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        setState(_loadMore);
      }
    });
  }

  void _loadMore() {
    for (var j = 0; j < 30; j++) {
      _suggestions.add(_randomNames.fullName());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: _suggestions.length,
      separatorBuilder: (context, i) => const Divider(height: 0),
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          for (var j = 0; j < 10; j++) {
            _suggestions.add(_randomNames.fullName());
          }
        }
        return ListTile(
          title: Text(_suggestions[i], style: _biggerFont),
          tileColor: i.isEven ? Colors.lightBlue : Colors.lightGreen,
          onTap: () {
            final messenger = ScaffoldMessenger.of(context);
            messenger.clearSnackBars();
            messenger.showSnackBar(SnackBar(content: Text(_suggestions[i])));
          },
        );
      },
    );
  }
}
