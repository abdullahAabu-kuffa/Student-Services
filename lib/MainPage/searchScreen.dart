import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchScrean extends StatefulWidget {
  const SearchScrean({super.key});

  @override
  State<SearchScrean> createState() => _SearchScreanState();
}

class _SearchScreanState extends State<SearchScrean> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SearchScreen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
