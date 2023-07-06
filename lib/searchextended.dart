import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _searchController = TextEditingController();

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                
              ),
              
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: (){},
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

 