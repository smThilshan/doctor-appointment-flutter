// // import 'package:doctor_appointment/utils/config.dart';
// // import 'package:flutter/material.dart';

// // class DoctorCard extends StatelessWidget {
// //   // final String doctorImage;
// //   // final String doctorName;
// //   // final String specialty;
// //   // final VoidCallback? onTap;

// //   final String route;
// //   final Map<String, dynamic> doctor;

// //   const DoctorCard({
// //     super.key,
// //     required this.route,
// //     required this.doctor,
// //     // required this.doctorImage,
// //     // required this.doctorName,
// //     // required this.specialty,
// //     // this.onTap,
// //   });

// //   static const String baseUrl = "http://127.0.0.1:8000/";
// //   @override
// //   Widget build(BuildContext context) {
// //     String getDoctorImageUrl(String profile) {
// //       if (profile.startsWith('http')) {
// //         return profile;
// //       } else {
// //         return "$baseUrl$profile";
// //       }
// //     }

// //     final imageUrl = getDoctorImageUrl(doctor['doctor_profile']);
// //     debugPrint(
// //         "Image URL: $imageUrl"); // ✅ Will now show the correctly resolved URL

// //     return Card(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       elevation: 3,
// //       child: Padding(
// //         padding: EdgeInsets.all(12.0),
// //         child: Row(
// //           children: [
// //             SizedBox(
// //                 width: 100,
// //                 height: 100,
// //                 // child: Image.network(
// //                 //   "http://127.0.0.1:8000/${doctor['doctor_profile']}",

// //                 //       http://127.0.0.1:8000/http://localhost/storage/profile-photos/eSsNkh1oshxWSEWDAepABnChVuID9Ab5T4BgCwCA.png

// //                 //   // "http://127.0.0.1:8000/storage/profile-photos/Lse9kl8Z220YZqAxBYPCZRL2EBFPpP9lZUS76L9J.png",
// //                 //   fit: BoxFit.fill,
// //                 // )),
// //                 child: Image.network(
// //                   getDoctorImageUrl(doctor['doctor_profile']),
// //                   fit: BoxFit.fill,
// //                 )),
// //             const SizedBox(width: 16),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text("Dr ${doctor['doctor_name']}",
// //                       style: const TextStyle(
// //                           fontSize: 16, fontWeight: FontWeight.bold)),
// //                   Text("${doctor['category']}",
// //                       style: const TextStyle(fontSize: 14, color: Colors.grey)),
// //                 ],
// //               ),
// //             ),
// //             // TextButton(
// //             //   onPressed: onTap,
// //             //   child: const Text("View Profile"),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:doctor_appointment/utils/config.dart';
// import 'package:flutter/material.dart';

// class DoctorCard extends StatelessWidget {
//   final String route;
//   final Map<String, dynamic> doctor;

//   const DoctorCard({
//     super.key,
//     required this.route,
//     required this.doctor,
//   });

//   // ✅ Add your base URL here
//   // static const String baseUrl = "http://127.0.0.1:8000/";

//   @override
//   Widget build(BuildContext context) {
//     String getDoctorImageUrl(dynamic profile) {
//       if (profile == null) {
//         // Return a placeholder if it's null
//         return 'https://ui-avatars.com/api/?name=unknown';
//       }

//       final String url = profile.toString(); // ✅ Explicitly cast to String
//       if (url.startsWith('http://localhost')) {
//         return url.replaceFirst('http://localhost', Config.baseUrl);
//       } else if (url.startsWith('http') || url.startsWith('https')) {
//         return url;
//       } else {
//         return "${Config.baseUrl}/$url"; // Handle relative path
//       }
//     }

//     final imageUrl = getDoctorImageUrl(doctor['doctor_profile']);
//     debugPrint("Image URL: $imageUrl");

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 100,
//               height: 100,
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Dr ${doctor['doctor_name']}",
//                       style: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.bold)),
//                   Text("${doctor['category']}",
//                       style: const TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:doctor_appointment/screens/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment/utils/config.dart';

class DoctorCard extends StatelessWidget {
  final String route;
  final Map<String, dynamic> doctor;

  const DoctorCard({
    super.key,
    required this.route,
    required this.doctor,
  });

  String getDoctorImageUrl(dynamic profile) {
    if (profile == null) {
      return 'https://ui-avatars.com/api/?name=unknown';
    }

    final String url = profile.toString();

    // ✅ 1. Already a fully-qualified URL
    if (url.startsWith('http') || url.startsWith('https')) {
      return url;
    }
    // ✅ 2. Old-style relative path saved in the database
    return "${Config.baseUrl}/$url";
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = getDoctorImageUrl(doctor['doctor_profile']);
    debugPrint("Image URL: $imageUrl");

    return InkWell(
      onTap: () {
        // ✅ Navigate to the DoctorDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(
              // doctorImage: imageUrl,
              // doctorName: doctor['doctor_name'] ?? 'N/A',
              // specialty: doctor['category'] ?? 'No Category',
              // description: doctor['about'] ?? 'No details available',
              doctor: doctor,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://ui-avatars.com/api/?name=${doctor['doctor_name'] ?? 'unknown'}',
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr ${doctor['doctor_name'] ?? 'N/A'}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("${doctor['category'] ?? 'No Category'}",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
