import 'package:audioplayers/audioplayers.dart';

Future<void> playSound(String soundPath) async {
  AudioPlayer player = AudioPlayer();
  await player.play(DeviceFileSource('assets/$soundPath'));
}
