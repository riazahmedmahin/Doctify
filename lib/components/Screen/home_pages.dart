import 'package:app/wigets/UpcommingCard.dart';
import 'package:app/wigets/category_itel.dart';
import 'package:app/wigets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authscreen/hello.dart';


class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 235, 251),
      appBar: Appbar,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find your medicine\nspecialist",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 29),
              ),
              SizedBox(height: 10,),
              TextFieldWithSortIcon(),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor specialist",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 22, 108, 207),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              calegoryItem(),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcomming",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 15,
                      color: Color.fromARGB(255, 22, 108, 207),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Upcommingcard(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 15,
                      color: Color.fromARGB(255, 22, 108, 207),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              TopDoctorsList(), // Display doctors in a grid
            ],
          ),
        ),
      ),
    );
  }

  AppBar get Appbar {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 224, 235, 251),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 5, right: 8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.menu_open,
            size: 20,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 9, bottom: 8, left: 12),
          child: CircleAvatar(
            radius: 20,
            child: GestureDetector(
              onTap: (){
                Get.to(FirestoreExample());
              },
              child: ClipOval(
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/128/3135/3135715.png",
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class calegoryItem extends StatelessWidget {
  calegoryItem({super.key});

  final List _category = [
    "https://cdn-icons-png.flaticon.com/128/17515/17515114.png",
    "https://cdn-icons-png.flaticon.com/128/9774/9774024.png",
    "https://cdn-icons-png.flaticon.com/128/11646/11646240.png",
    "https://cdn-icons-png.flaticon.com/128/14228/14228770.png",
    "https://cdn-icons-png.flaticon.com/128/14949/14949202.png"
  ];

  final List _text = [
    'Neuro',
    'Cardio',
    'Dentist',
    'Or-tho',
    'Dermatology'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: _category.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            image: _category[index],
            text: _text[index],
          );
        },
        separatorBuilder: (_, __) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}

class TopDoctorsList extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Selkon ",
      "specialty": "Heart Surgeon spealist",
      "hospital": "City Hospital",
      "rating": "4.5",
      "image": "https://cdn-icons-png.flaticon.com/128/2785/2785482.png"
    },
    {
      "name": "Dr. Mostafa",
      "specialty": "Dental Specialist",
      "hospital": "Green Health Clinic",
      "rating": "4.7",
      "image": "https://cdn-icons-png.flaticon.com/128/2785/2785482.png"
    },
    {
      "name": "Dr. Maria",
      "specialty": "Neurologist",
      "hospital": "Central Medical Center",
      "rating": "4.6",
      "image": "https://cdn-icons-png.flaticon.com/128/2785/2785482.png"
    },
    {
      "name": "Dr.  doe",
      "specialty": "Cardiologist",
      "hospital": "Community Health Care",
      "rating": "4.8",
      "image": "https://cdn-icons-png.flaticon.com/128/2785/2785482.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two cards per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5, // oi ...... age 1.6  chilo IOS e **********
      ),
      itemBuilder: (context, index) {
        return TopDoctorCard(
          name: doctors[index]['name']!,
          specialty: doctors[index]['specialty']!,
          hospital: doctors[index]['hospital']!,
          rating: doctors[index]['rating']!,
          image: doctors[index]['image']!,
        );
      },
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String hospital;
  final String rating;
  final String image;

  const TopDoctorCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 20, // Image on the side, slightly larger for visibility
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            rating,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.star, color: Colors.amber, size: 12),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6), // Space between sections
              Text(
                specialty,
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              //SizedBox(height: 4),
              Text(
                hospital,
                style: TextStyle(fontSize: 11, color: Colors.black,fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Positioned(
            bottom: 3,
            //left: 5,
            child: SizedBox(
              width: 80, // Smaller width for a compact button
              height: 20, // Smaller height
              child: ElevatedButton(
                onPressed: () {
                  // Handle appointment button tap
                  print('Get Appointment for $name');
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.blue, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3), // Rounded corners for the button
                  ),
                  padding: EdgeInsets.zero, // Compact padding
                ),
                child: Text(
                  'Appointment',
                  style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
