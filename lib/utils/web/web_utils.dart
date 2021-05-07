import 'dart:html';

class WebUtils {
  static void exitFullscreen() {
    document.exitFullscreen();
  }

  static void requestFullscreen() {
    document.documentElement!.requestFullscreen();
  }
}
