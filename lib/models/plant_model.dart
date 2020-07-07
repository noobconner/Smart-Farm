import 'package:firebase_database/firebase_database.dart';

class PlantModel {
  // Field
  String humidity,temperature,water,light;


  // Construr
  PlantModel(this.humidity,this.temperature,this.water,this.light);
   PlantModel.formSnapshot(DataSnapshot snapshot){
    humidity = snapshot.value['humidity'];
    temperature = snapshot.value['temperature'];
    water = snapshot.value['Water Level'];
    light = snapshot.value['Light'];
  }
}