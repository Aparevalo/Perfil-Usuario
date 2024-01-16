import 'dart:io';

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final File? initialImage;

  EditProfileScreen({
    required this.initialName,
    required this.initialEmail,
    required this.initialImage,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  File? _image;

  @override
  void initState() {
    // Inicializa los controladores y la imagen con los valores iniciales
    _nameController.text = widget.initialName;
    _emailController.text = widget.initialEmail;
    _image = widget.initialImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _selectImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null ? Icon(Icons.camera_alt) : null,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Guarda los cambios y retorna los nuevos datos a la pantalla de perfil
                _saveChanges();
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage() async {
    // Agrega lógica para seleccionar una imagen desde la galería
  }

  void _saveChanges() {
    // Simulación simple: Imprime los nuevos valores y la imagen y retorna a la pantalla de perfil
    String newName = _nameController.text;
    String newEmail = _emailController.text;

    print('Nombre actualizado: $newName');
    print('Correo electrónico actualizado: $newEmail');
    print('Imagen actualizada: $_image');

    // Puedes implementar aquí la lógica para guardar los cambios en tu aplicación
    // ...

    // Retorna los nuevos datos a la pantalla de perfil
    Navigator.pop(context, {'name': newName, 'email': newEmail, 'image': _image});
  }
}
