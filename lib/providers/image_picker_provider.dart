import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A provider class for handling image picking functionalities.
///
/// This class uses the `ChangeNotifier` mixin to notify listeners
/// when the selected image changes.
class ImagePickerProvider with ChangeNotifier {
  // Holds the currently selected image file.
  // It's private to ensure that modifications go through the defined methods.
  File? _selectedImage;

  // Instance of the ImagePicker plugin to interact with the device's gallery or camera.
  final ImagePicker _picker = ImagePicker();

  /// Getter for the selected image file.
  ///
  /// Returns the `File` object of the selected image, or `null` if no image is selected.
  File? get selectedImage => _selectedImage;

  /// Picks an image from the device's gallery.
  ///
  /// This asynchronous method uses the `ImagePicker` plugin to open the gallery
  /// and allow the user to select an image. If an image is selected,
  /// `_selectedImage` is updated, and listeners are notified.
  // TODO: Add functionality to pick image from camera.
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      // If a file is picked, convert it to a File object and store it.
      _selectedImage = File(pickedFile.path);
      notifyListeners(); // Notify listeners about the change.
    }
  }

  /// Clears the currently selected image.
  void clearImage() {
    _selectedImage = null;
    notifyListeners(); // Notify listeners that the image has been cleared.
  }
}
