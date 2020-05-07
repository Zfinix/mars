import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mars/core/api/api.dart';
import 'package:mars/core/const/const.dart';
import 'package:mars/core/model/camera_model.dart';
import 'package:mars/utils/navigation.dart';
import 'package:mars/views/home/details.dart';
import 'package:mars/views/home/home.dart';

class HomeViewModel extends ChangeNotifier {
  tabs() => [
        Curiosity(),
        Spirit(),
        Curiosity(),
      ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  DateTime _selectedDate = DateTime(2019, 12, 1);
  DateTime get selectedDate => _selectedDate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  CameraModel _selectedCamera = cameraModels[4];
  CameraModel get selectedCamera => _selectedCamera;

  set selectedCamera(val) {
    _selectedCamera = val;
    notifyListeners();
  }

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  set selectedDate(DateTime val) {
    _selectedDate = val;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    var _tempDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1999, 12, 31),
        initialDate: DateTime.now(),
        lastDate: DateTime.now());

    if (_tempDate != null) _selectedDate = _tempDate;
    notifyListeners();
  }

  void selectCameraModal(context) {
    final FixedExtentScrollController scrollController =
        new FixedExtentScrollController(initialItem: 0);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return cameraModels != null && cameraModels.length > 0
            ? Container(
                height: 240,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: new SafeArea(
                    child: CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 50,
                      backgroundColor: Color(0xFFFA705F),
                      onSelectedItemChanged: (int i) {
                        _selectedCamera = cameraModels[i];
                        notifyListeners();
                      },
                      children: new List<Widget>.generate(cameraModels.length,
                          (int i) {
                        return new Center(
                          child: new Text(cameraModels[i].name.toUpperCase(),
                              style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              )),
                        );
                      }),
                    ),
                  ),
                ))
            : Text('');
      },
    );
  }

  getPhotos(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      var nasaApiReq = await NasaAPI.getPhotos(context,
          rover: getMarsRover(), dateTime: _selectedDate);

      if (nasaApiReq != null)
        navigate(context, DetailsPage(nasaRoverModel: nasaApiReq));

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;

      notifyListeners();
    }
  }

  String getMarsRover() => _selectedIndex == 0
      ? "curiosity"
      : _selectedIndex == 1 ? "spirit" : "opportunity";
}
