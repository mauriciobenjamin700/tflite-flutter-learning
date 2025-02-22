import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? filePath;

  pickImageGallery() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      File imageMap = File(image.path);
      setState(() {
        filePath = imageMap;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mango Dresses Detection"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Card(
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 280,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(image: AssetImage("lib/assets/upload.jpg"))
                          ),
                          child: filePath == null 
                            ? const Text("")
                            : Image.file(filePath!, fit: BoxFit.cover)
                            ,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Label", 
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  )
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "The Accuracy is: ", 
                                style: TextStyle(
                                    fontSize: 18,
                                  )
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  foregroundColor: Colors.black,
                ),
                child: const Text("Take a Photo"),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImageGallery();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  foregroundColor: Colors.black,
                ),
                child: const Text("Pick from gallery"),
              ),
          ],
        ),
      ),
      ),
    );
  }
}