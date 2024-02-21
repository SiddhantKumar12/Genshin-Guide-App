import 'image.dart';

class ChooseImage {
  static String chooseElementBGImage(String elementImage) {
    String eImage = elementImage; // Example string argument

    String selectedString;

    switch (eImage) {
      case "pyro":
        selectedString = MyImage.pyroImage;
        break;
      case "cryo":
        selectedString = MyImage.cryoImage;
        break;
      case "hydro":
        selectedString = MyImage.hydroImage;
        break;
      case "geo":
        selectedString = MyImage.geoImage;
        break;
      case "electro":
        selectedString = MyImage.electroImage;
        break;
      case "anemo":
        selectedString = MyImage.anemoImage;
        break;
      case "dendro":
        selectedString = MyImage.dendroImage;
        break;

      default:
        selectedString = MyImage.bg;
    }
    return selectedString;
  }

  static String chooseBGImage(String elementImage) {
    String eImage = elementImage; // Example string argument

    String selectedString;

    switch (eImage) {
      case "pyro":
        selectedString = MyImage.pyroImage;
        break;
      case "cryo":
        selectedString = MyImage.cryoImage;
        break;
      case "hydro":
        selectedString = MyImage.hydroImage;
        break;
      case "geo":
        selectedString = MyImage.geoImage;
        break;
      case "electro":
        selectedString = MyImage.electroImage;
        break;
      case "anemo":
        selectedString = MyImage.anemoImage;
        break;
      case "dendro":
        selectedString = MyImage.dendroImage;
        break;

      default:
        selectedString = MyImage.bg;
    }
    return selectedString;
  }
}
