import 'package:flutter/material.dart';

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  String selectedCategory = 'Neurologist';

  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Aaliya Y.',
      'qualification': 'MDS, FDS RCPS',
      'specialty': 'Neurologist',
      'imagePath': 'https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZG9jdG9yfGVufDB8fDB8fHww',
      'rating': '4.5 (2530)',
      'fees': '\$50.99',
    },
    {
      'name': 'Dr. Amira',
      'qualification': 'BDS, Dentistry',
      'specialty': 'Dentist',
      'imagePath': 'https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZG9jdG9yfGVufDB8fDB8fHww',
      'rating': '4.5 (2530)',
      'fees': '\$50.99',
    },
    {
      'name': 'Dr. Anna G.',
      'qualification': 'Cardiologist',
      'specialty': 'Cardiologist',
      'imagePath': 'assets/doctor3.jpg',
      'rating': '4.5 (2530)',
      'fees': '\$50.99',
    },
    {
      'name': 'Dr. Anne.',
      'qualification': 'Hepatology',
      'specialty': 'Hepatology',
      'imagePath': 'assets/doctor4.jpg',
      'rating': '4.5 (2530)',
      'fees': '\$50.99',
    },
    {
      'name': 'Dr. Andrea H.',
      'qualification': 'Neurosurgery',
      'specialty': 'Neurologist',
      'imagePath': 'assets/doctor5.jpg',
      'rating': '4.5 (2530)',
      'fees': '\$50.99',
    },
  ];

  // List of available categories
  final List<String> categories = [
    'Neurologist',
    'Dentist',
    'Cardiologist',
    'Hepatology',
  ];

  @override
  Widget build(BuildContext context) {
    // Filter doctors based on selected category
    final filteredDoctors = doctors.where((doctor) {
      return doctor['specialty'] == selectedCategory;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFE0EBFB), // Light background color
      appBar: AppBar(
        title: Text("Doctor"),
        backgroundColor: Color.fromARGB(255, 224, 235, 251),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 12, bottom: 7, right: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Category Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: categories.map((category) {
                return _buildCategoryChip(category);
              }).toList(),
            ),
          ),
          // Doctor List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return _buildDoctorCard(
                  doctor['name']!,
                  doctor['qualification']!,
                  doctor['specialty']!,
                  doctor['imagePath']!,
                  doctor['rating']!,
                  doctor['fees']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build category chips
  Widget _buildCategoryChip(String category) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(category),
        labelStyle: TextStyle(
          color: selectedCategory == category ? Colors.white : Colors.black,
        ),
        selectedColor: Colors.blueAccent,
        backgroundColor: Colors.grey.shade200,
        selected: selectedCategory == category,
        onSelected: (bool selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }

  // Helper method to build each doctor card
  Widget _buildDoctorCard(
      String name,
      String qualification,
      String specialty,
      String imagePath,
      String rating,
      String fees,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imagePath), // Doctor profile image
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    qualification,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text(
                        rating,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Fees $fees',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Book Now',style: TextStyle(fontSize: 15),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
