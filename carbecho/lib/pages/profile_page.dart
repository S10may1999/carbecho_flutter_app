import 'dart:convert';
import 'dart:typed_data';
import 'package:carbecho/utility/add_photo.dart';
import 'package:http/http.dart' as http;
import 'package:carbecho/utility/utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  List<dynamic> cars = [];
  List<dynamic> list1 = [];
  List<dynamic> modal = [];
  String? carName1;
  String? carModal1;
  String? datePick = 'Select Date';

  void fetchCar() async {
    print("fetchCar Api is called");
    final url = 'https://car-data.p.rapidapi.com/cars';
    final Map<String, String> queryParams = {
      'limit': '50',
      'page': '0',
    };
    final response = await http
        .get(Uri.parse(url).replace(queryParameters: queryParams), headers: {
      'X-RapidAPI-Key': '9d8a59e8c6mshf68e1dd5aaa2f7ap16a5a2jsna425544ee488',
      'X-RapidAPI-Host': 'car-data.p.rapidapi.com'
    });
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      cars = json;
    });
    print(cars);
    list1 = cars.map((dynamic e) => e['make']).toList();
    print(list1);
    modal = cars.map((dynamic e) => e['model']).toList();
    print(modal);
  }

  UserSignOut() {
    FirebaseAuth.instance.signOut();
  }

  Uint8List? _image;
  Uint8List? _carsImage;

  void selectImageFromGallery() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void selectImageFromCamera() async {
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  void selectImageFromGalleryForCar() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _carsImage = img;
    });
  }

  void selectImageFromCameraForCar() async {
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _carsImage = img;
    });
  }

  showOption() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      selectImageFromGallery();
                    },
                    child: Text("Photo Gallery")),
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      selectImageFromCamera();
                    },
                    child: Text("Camera"))
              ],
            ));
  }

  saveCarDatilInFirebase() async {
    String carName = carName1.toString();
    String carModal = carModal1.toString();
    String CarPurchaseDate = datePick.toString();
    String resp = await StoreData().saveCarData(
        carName: carName,
        carModal: carModal,
        CarPurchaseDate: CarPurchaseDate,
        file: _carsImage!);
  }

  showOption2() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      selectImageFromGalleryForCar();
                    },
                    child: Text("Photo Gallery")),
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                      selectImageFromCameraForCar();
                    },
                    child: Text("Camera"))
              ],
            ));
  }

  carAddingButton() {
    fetchCar();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add car detail"),
              content: Container(
                child: Column(children: [
                  DropdownSearch(
                    popupProps: PopupProps.menu(
                        showSearchBox: true, showSelectedItems: false),
                    items: list1,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Car List",
                      ),
                    ),
                    onChanged: (selectedValue) {
                      carName1 = selectedValue;
                      print(carName1);
                    },
                  ),
                  DropdownSearch(
                    popupProps: PopupProps.menu(
                        showSearchBox: true, showSelectedItems: false),
                    items: modal,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Modal List",
                      ),
                    ),
                    onChanged: (selectedValue) {
                      carModal1 = selectedValue;
                      print(carModal1);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: datePick,
                        suffix: IconButton(
                          icon: Icon(Icons.calendar_month_outlined),
                          onPressed: () async {
                            DateTime? datePicker = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2024),
                                initialDate: DateTime.now());

                            setState(() {
                              datePick = datePicker.toString();
                              print(datePick);
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton.icon(
                      onPressed: () => showOption2(),
                      icon: Icon(Icons.add_a_photo_rounded),
                      label: _carsImage != null
                          ? Text(_carsImage.toString())
                          : Text("Select Image"))
                ]),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          saveCarDatilInFirebase();
                          Navigator.of(context).pop();
                        },
                        child: Text("Save"))
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
          actions: [
            IconButton(
                onPressed: () => UserSignOut(),
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => carAddingButton(),
          child: Icon(Icons.add_a_photo_outlined),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png"),
                        ),
                  Positioned(
                    child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () => showOption()),
                    bottom: -10,
                    left: 84,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Cars You Added",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                      color: Colors.yellow.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.3),
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: carSection(),
                ),
              )
            ],
          ),
        ));
  }

  Widget carSection() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: _carsImage != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/carbecho-80ea4.appspot.com/o/CarImage?alt=media&token=27ec4b44-aa7f-4bfd-a720-da386d420959'),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/001/193/929/original/vintage-car-png.png'),
              ),
        title: Text("Name of Car"),
        subtitle: Text("Price of the car"),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      ),
      itemCount: 10,
      scrollDirection: Axis.vertical,
    );
  }
}
