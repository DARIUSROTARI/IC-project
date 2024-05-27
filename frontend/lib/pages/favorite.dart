// import 'package:flutter/material.dart';
// import 'package:proiect_ic/components/Parfum.dart';
// import 'package:proiect_ic/components/parfume_widged.dart';
// import 'package:proiect_ic/services/parfum_service.dart'; // Import the service
//
// class ViewFavoriteRecipesWidget extends StatefulWidget {
//   ViewFavoriteRecipesWidget();
//
//   @override
//   _ViewFavoriteRecipesWidgetState createState() =>
//       _ViewFavoriteRecipesWidgetState();
// }
// class _ViewFavoriteRecipesWidgetState extends State<ViewFavoriteRecipesWidget> {
//   List<Parfum> parfumes = [];
//   final ScrollController _scrollController = ScrollController();
//   bool isLoading = false;
//   Parfum? selectedParfum;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchFavorites(); // Fetch initial favorites
//
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent &&
//           !isLoading) {
//         _fetchFavorites(); // Fetch more data when the end of the list is reached
//       }
//     });
//   }
//
//   Future<void> _fetchFavorites() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       List<Parfum>? newParfumes = await ParfumService.getFavourites();
//       setState(() {
//         if (newParfumes != null) {
//           parfumes.addAll(newParfumes);
//         }
//       });
//     } catch (e) {
//       print('Error fetching favorites: $e');
//     }
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   void _removeFromList() {
//     setState(() {
//       parfumes.remove(selectedParfum);
//       selectedParfum = null;
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Parfumes'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: ListView.builder(
//           controller: _scrollController,
//           itemCount: parfumes.length + (isLoading ? 1 : 0),
//           itemBuilder: (BuildContext context, int index) {
//             if (index == parfumes.length) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final parfum = parfumes[index];
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedParfum = parfum;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: selectedParfum == parfum
//                       ? Colors.grey.withOpacity(0.5)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: ParfumCard(parfum: parfum),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: selectedParfum == null
//           ? null
//           : Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               // Perform action for "Remove from List"
//               _removeFromList();
//             },
//             backgroundColor: Colors.red,
//             child: Icon(Icons.remove),
//           ),
//           SizedBox(height: 8),
//           FloatingActionButton(
//             onPressed: () {
//               // Navigate to cart or perform action
//               print('Selected parfum: ${selectedParfum!.id}');
//             },
//             backgroundColor: Colors.blue,
//             child: Icon(Icons.shopping_cart),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:proiect_ic/components/Parfum.dart';
import 'package:proiect_ic/components/parfume_widged.dart';
import 'package:proiect_ic/services/parfum_service.dart'; // Import the service

class ViewFavoriteRecipesWidget extends StatefulWidget {
  ViewFavoriteRecipesWidget();

  @override
  _ViewFavoriteRecipesWidgetState createState() =>
      _ViewFavoriteRecipesWidgetState();
}
class _ViewFavoriteRecipesWidgetState extends State<ViewFavoriteRecipesWidget> {
  List<Parfum> parfumes = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  Parfum? selectedParfum;

  @override
  void initState() {
    super.initState();
    _fetchFavorites(); // Fetch initial favorites

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !isLoading) {
        _fetchFavorites(); // Fetch more data when the end of the list is reached
      }
    });
  }

  Future<void> _fetchFavorites() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Parfum>? newParfumes = await ParfumService.getFavourites();
      setState(() {
        if (newParfumes != null) {
          parfumes.addAll(newParfumes);
        }
      });
    } catch (e) {
      print('Error fetching favorites: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  void _removeFromList() {
    setState(() {
      parfumes.remove(selectedParfum);
      selectedParfum = null;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parfumes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: parfumes.length + (isLoading ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index == parfumes.length) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final parfum = parfumes[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedParfum = parfum;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedParfum == parfum
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ParfumCard(parfum: parfum),
              ),
            );
          },
        ),
      ),
      floatingActionButton: selectedParfum == null
          ? null
          : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Navigate to cart or perform action
              print('Selected parfum: ${selectedParfum!.id}');
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              // Perform action for "Remove from List"
              _removeFromList();
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
