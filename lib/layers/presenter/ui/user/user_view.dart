import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  File? _avatarImage;
  ImageProvider? image;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _avatarImage = null;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
final user = await ParseUser.currentUser() as ParseUser;
    nomeController.text = user.get("name") ?? "";
    final age = user.get("age") ?? "";
    idadeController.text = age.toString();
    cidadeController.text = user.get("city") ?? "";
    final avatarImage = user.get("avatarImage") as ParseFileBase?;
    if(avatarImage != null){
      image = NetworkImage(avatarImage.url!); 
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        _avatarImage != null ? FileImage(_avatarImage!) : image,
                    child: _avatarImage == null && image == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Adicionar') {
                          _pickImage();
                        } else if (value == 'Remover') {
                          _removeImage();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Adicionar',
                          child: Text('Adicionar/Alterar foto'),
                        ),
                        const PopupMenuItem(
                          value: 'Remover',
                          child: Text('Remover foto'),
                        ),
                      ],
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idadeController,
              decoration: const InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: cidadeController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Aqui você pode salvar os dados, enviar para servidor etc.
                final user = await ParseUser.currentUser() as ParseUser;
                
                user
                  ..set("name", nomeController.text)
                  ..set("age", int.parse(idadeController.text))
                  ..set("city", cidadeController.text);

                  if(_avatarImage != null){
                    final photo = ParseFile(_avatarImage);
                    await photo.save();
                    user.set("avatarImage", photo);
                  }

                  await user.save();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Informações salvas!')),
                );
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
