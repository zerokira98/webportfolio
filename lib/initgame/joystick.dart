import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/rendering.dart';
import 'package:newwebsite/initgame/player.dart';

class JsCom extends JoystickComponent {
  SpriteComponent knoby;
  SpriteComponent backgroundy;
  EdgeInsets marginy;
  JsCom(
      {required this.knoby,
      required this.backgroundy,
      required this.marginy,
      this.player})
      : super(knob: knoby, background: backgroundy, margin: marginy);
  JsCom addPlayer(Player player) => JsCom(
      knoby: this.knoby,
      backgroundy: backgroundy,
      marginy: marginy,
      player: player);
  Player? player;
  @override
  bool onDragUpdate(DragUpdateEvent event) {
    if (player != null) {
      if (direction.name.contains("eft")) {
        player!.current = PlayerState.running;
        if (player!.facingRight) {
          flipHorizontally();
          player!.facingRight = false;
        }
        player!.horizontalDirection = -1;
      } else if (direction.name.contains("ight")) {
        if (!(player!.facingRight)) {
          flipHorizontally();
          player!.facingRight = true;
        }
        player!.horizontalDirection = 1;

        player!.current = PlayerState.running;
      }
    }
    return super.onDragUpdate(event);
  }

  @override
  bool onDragEnd(DragEndEvent _) {
    if (player != null) {
      player!.horizontalDirection = 0;
      player!.current = PlayerState.idle;
    }
    return super.onDragEnd(_);
  }
}
