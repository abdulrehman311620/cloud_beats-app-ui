 import 'package:basemain/feedextended.dart';
import 'package:basemain/homeextended.dart';
import 'package:basemain/library.dart';
import 'package:basemain/searchextended.dart';
 
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    FeedTab(),
    SearchTab(),
    LibraryTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _getAppBarTitle(),
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            backgroundColor: Colors.black,
            label: 'Library',
          ),
        ],
        backgroundColor: Colors.blue, // Set the background color here
      ),
    );
  }

  Widget _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return const Center(child: Text('Home'));
      case 1:
        return const Center(child: Text('Feed'));
      case 2:
        return const Center(child: Text('Search'));
      case 3:
        return const Center(child: Text('Library'));
      default:
        return const Center(child: Text('Home'));
    }
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MusicAppHomeScreen();
  }
}

class FeedTab extends StatelessWidget {
  const FeedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FeedScreen();
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SearchForm();
  }
}

class LibraryTab extends StatelessWidget {
  const LibraryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Library();
  }
}
