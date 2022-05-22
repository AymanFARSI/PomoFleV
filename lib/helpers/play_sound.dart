import 'package:audioplayers/audioplayers.dart';

Future<void> playSound(String soundPath) async {
  AudioPlayer player = AudioPlayer();
  await player.setVolume(0.5);
  await player.play(DeviceFileSource('assets/$soundPath'));
}
