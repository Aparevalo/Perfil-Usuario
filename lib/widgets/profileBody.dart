// Dentro de widgets/profile_body.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:perfilusuario/screens/editProfileScreen.dart';

class UserProfileBody extends StatelessWidget {
  final String name;
  final String email;
  final File? image;
  final Function(String, String, File?) updateProfile;
  final VoidCallback selectImage;

  UserProfileBody({
    required this.name,
    required this.email,
    required this.image,
    required this.updateProfile,
    required this.selectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: selectImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageProvider(),
                child: image == null ? Icon(Icons.camera_alt) : null,
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Correo electrónico: $email'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      initialName: name,
                      initialEmail: email,
                      initialImage: image,
                    ),
                  ),
                );

                if (result != null &&
                    result.containsKey('name') &&
                    result.containsKey('email')) {
                  // Update the profile in UserProfileScreen
                  updateProfile(result['name'], result['email'], result['image']);
                }
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider<Object>? _imageProvider() {
    if (image != null) {
      return FileImage(image!);
    } else {
      return AssetImage('lib/assets/perfil.png');
    }
  }
}
