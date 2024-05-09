import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jody/models/favorites_tourism.dart';
import 'package:jody/models/torist_place.dart';

class HistoryOfPlace extends StatefulWidget {
  final TourismPlace tourismPlace;
  

  HistoryOfPlace({required this.tourismPlace});

  @override
  _HistoryOfPlaceState createState() => _HistoryOfPlaceState();
}

class _HistoryOfPlaceState extends State<HistoryOfPlace> {
  bool _isPressed = false;

  final String baseUrl = 'https://kemet-gp2024.onrender.com/api/v1';

  Future<void> addToWishlist(String tourismId, String token) async {
    try {
      final dio = Dio();
      final response = await dio.patch(
        '$baseUrl/tourismPlaceWL/addToWishList',
        data: {'document': tourismId},
        options: Options(
          headers: {'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'},
        ),
      );
      if (response.statusCode == 200) {
        print('TourismPlace added to wishlist successfully');
      } else {
        throw Exception('Failed to add trip to wishlist');
      }
    } catch (e) {
      print('Error adding trip to wishlist: $e');
      throw Exception('Failed to add TourismPlace to wishlist');
    }
  }

  Future<void> _removeFromWishlist(String tourismId, String token) async {
    final String apiUrl =
        'https://kemet-gp2024.onrender.com/api/v1/tourismPlaceWL/removeFromWishList/$tourismId';

    try {
      final dio = Dio();
      final response = await dio.delete(
        apiUrl,
        options: Options(
          headers: {'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'},
        ),
      );

      if (response.statusCode == 200) {
        print('TourismPlace with ID $tourismId removed from wishlist successfully.');
        // Optionally, handle state update or UI changes after successful removal
      } else {
        throw Exception(
            'Failed to remove trip from wishlist: ${response.statusCode}');
      }
    } catch (e) {
      print('Error removing trip from wishlist: $e');
      // Handle error, show user feedback, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the back button
        backgroundColor: const Color.fromARGB(255, 235, 231, 231),
        // Set the background color to white
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20), // Adjust padding
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
                      widget.tourismPlace.id,
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'); // Replace 'your_token_here' with your actual token
                } else {
                  _removeFromWishlist(
                      widget.tourismPlace.id,
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMzMDUxM2ViYTYyM2M3MmNhMjFlMjAiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDY4MTk3OH0.2JrVkXVXxzHmFlndsvzAynVKa89b7tOrvR6xOVaC4j0'); // Replace 'your_token_here' with your actual token
                }
              },),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                 
                    Container(
                      height: 211.0, // Set a fixed height for the container
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.tourismPlace.images.length,
                        itemBuilder: (context, index) {
                          String imageUrl = widget.tourismPlace.images[index];
                          return Padding(
                            padding: EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Material(
                                elevation: 10,
                                child: SizedBox(
                                  width: 400, // Set the width of each image container
                                  height: 211.0, // Set the height of each image container
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageUrl),
                                      ),
                                    ),
                                  ),
                                ),
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        widget.tourismPlace.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  widget.tourismPlace.informationAbout,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.0, left: 100, right: 100),child: ElevatedButton(
                  onPressed: () {
                    // Create a Trip object based on the TouristPlace details
                    // Navigate to MyTripOfPlace screen with the created Trip object
                    
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => TripsScreen()),
                    // );
                  },
                  child: Text(
                    'Your Trips',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 180, 17, 0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}