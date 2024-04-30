// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gp_project/components/custom_edit_photo.dart';
// import 'package:gp_project/constraints.dart';
// import 'package:gp_project/cubit/profile_cubit.dart';
// import 'package:image_picker/image_picker.dart';

// void showUpdate2Dialog(
//   BuildContext context,
//   String field,
//   String hintText,
//   TextEditingController? firstNameController,
//   TextEditingController? lastNameController,
//   TextEditingController? cityController,
//   void Function(XFile pickedImage) onUpdate,
//   BlocConsumer<ProfileCubit, ProfileState> blocConsumer, // Accept BlocConsumer as parameter

// ) {
//   //TextEditingController controller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//       showDialog(
//           context: context,
//           builder: (context) {
//             return Center(
//               child: Container(
//                 constraints: const BoxConstraints(maxWidth: 600),
//                 child: AlertDialog(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(
//                         height: 24,
//                       ),
//                       Form(
//                           key: _formKey,
//                           child: Column(children: [
//                             Text(
//                               field,
//                               style: const TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'poppins',
//                                 //color: Colors.black
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             PickImageWidget(
//                               onImagePicked: onUpdate,
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             TextFormField(
//                               controller: firstNameController,
//                               decoration: InputDecoration(
//                                 hintText: hintText,
//                                 border: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 1)),
//                                 focusedBorder: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: kPrimaryColor, width: 2)),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               controller: lastNameController,
//                               decoration: InputDecoration(
//                                 hintText: hintText,
//                                 border: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 1)),
//                                 focusedBorder: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: kPrimaryColor, width: 2)),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               controller: cityController,
//                               decoration: InputDecoration(
//                                 hintText: hintText,
//                                 border: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 1)),
//                                 focusedBorder: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                     borderSide: BorderSide(
//                                         color: kPrimaryColor, width: 2)),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             ElevatedButton(
//                               style: const ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStatePropertyAll<Color>(
//                                         Color(0xffB68B25)),
//                                 minimumSize:
//                                     MaterialStatePropertyAll(Size(340, 50)),
//                                 shape: MaterialStatePropertyAll(
//                                     RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12)),
//                                 )),
//                               ),
//                               child: const Text(
//                                 'Cancel',
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontFamily: 'poppins',
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     onUpdate(XFile(
//                                         '')); // Pass a placeholder XFile here
//                                     Navigator.of(context)
//                                         .pop(); // Dismiss the dialog
//                                   }
//                                 },
//                                 child: const Text(
//                                   'Update',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontFamily: 'poppins',
//                                       color: kPrimaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       decoration: TextDecoration.underline),
//                                 )),
//                             const SizedBox(
//                               height: 30,
//                             )
//                           ]))
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//   );
// }
