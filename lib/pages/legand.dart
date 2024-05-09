import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Legend extends StatefulWidget {
  final Map<String, dynamic> legend;

  Legend({required this.legend});

  @override
  _LegendState createState() => _LegendState();
}

class _LegendState extends State<Legend> {
  bool _isPressed = false;
  final String baseUrl = 'https://kemet-gp2024.onrender.com/api/v1';

  Future<void> addToWishlist(String legendId, String token) async {
    try {
      final dio = Dio();
      final response = await dio.patch(
        '$baseUrl/tripWL/addToWishList',
        data: {'document': legendId},
        options: Options(
          headers: {'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'},
        ),
      );
      if (response.statusCode == 200) {
        print('Legend added to wishlist successfully');
      } else {
        throw Exception('Failed to add legend to wishlist');
      }
    } catch (e) {
      print('Error adding legend to wishlist: $e');
      throw Exception('Failed to add legend to wishlist');
    }
  }

  Future<void> _removeFromWishlist(String legendId, String token) async {
    final String apiUrl =
        'https://kemet-gp2024.onrender.com/api/v1/tripWL/removeFromWishList/$legendId';

    try {
      final dio = Dio();
      final response = await dio.delete(
        apiUrl,
        options: Options(
          headers: {'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'},
        ),
      );

      if (response.statusCode == 200) {
        print('Legend with ID $legendId removed from wishlist successfully.');
        // Optionally, handle state update or UI changes after successful removal
      } else {
        throw Exception('Failed to remove legend from wishlist: ${response.statusCode}');
      }
    } catch (e) {
      print('Error removing legend from wishlist: $e');
      // Handle error, show user feedback, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the back button
        backgroundColor: const Color.fromARGB(255, 235, 231, 231),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isPressed ? Colors.red : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isPressed = !_isPressed;
                });

                if (_isPressed) {
                  addToWishlist(
                    widget.legend['_id'],
                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0', // Replace 'your_token_here' with your actual token
                  );
                } else {
                  _removeFromWishlist(
                    widget.legend['_id'],
                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0', // Replace 'your_token_here' with your actual token
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Stack(
                children:[SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.legend['images'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.legend['images'][index],
                            width: 200,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                 Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              
              ),
            
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.legend['name'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                widget.legend['informationAbout'],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}