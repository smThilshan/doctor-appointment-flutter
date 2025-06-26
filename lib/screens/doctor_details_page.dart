// import 'package:flutter/material.dart';

// class DoctorDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> doctor;

//   const DoctorDetailsPage({super.key, required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('Doctor Image URL: ${doctor['imageUrl']}');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(doctor['name']),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Doctor Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: Image.network(
//                   doctor['imageUrl'] ?? 'https://via.placeholder.com/150',
//                   height: 150,
//                   width: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Doctor Name
//               Text(
//                 doctor['name'] ?? 'No Name',
//                 style:
//                     const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),

//               // Doctor Specialty
//               Text(
//                 doctor['specialty'] ?? 'Specialty not available',
//                 style: const TextStyle(fontSize: 18, color: Colors.teal),
//               ),

//               const SizedBox(height: 20),

//               // Experience
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.work, color: Colors.teal),
//                   const SizedBox(width: 8),
//                   Text(
//                     doctor['experience'] ?? 'N/A',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               // Doctor Details / About
//               Text(
//                 doctor['about'] ?? 'No details available',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16),
//               ),

//               const SizedBox(height: 30),

//               // Book Appointment Button
//               GestureDetector(
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                   decoration: BoxDecoration(
//                     color: Colors.teal,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text(
//                     'Book Haal',
//                     style: TextStyle(color: Colors.blue, fontSize: 18),
//                   ),
//                 ),
//                 onTap: () {
//                   print('Book appointment pressed! MAn');
//                 },
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     print('Book appointment pressed!');
//                     // Navigator.of(context)
//                     //     .pushNamed('booking', arguments: doctor);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Book Appointment',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
