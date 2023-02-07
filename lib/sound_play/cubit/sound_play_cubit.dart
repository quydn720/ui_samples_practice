import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';

class SoundplayNowPlaying extends Cubit<double> {
  SoundplayNowPlaying(this._audioPlayer) : super(0);

  final AudioPlayer _audioPlayer;

  void play() {
    _audioPlayer.play();
    emit(state + 1);
  }

  void pause() => emit(state - 1);

  void forward() {
    emit(state - 1);
  }
}
