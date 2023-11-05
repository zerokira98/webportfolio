import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/src/events/messages/tap_down_event.dart';
import 'package:newwebsite/initgame/collision_game.dart';
import 'package:newwebsite/initgame/player.dart';

class Arrow extends SpriteComponent
    with TapCallbacks, HasGameReference<CollisionApp> {
  Player player;
  String direction;
  Vector2 startPosition;
  Arrow({required this.player, String? direction, required this.startPosition})
      : direction = direction ?? 'right',
        super(
            position: startPosition,
            anchor: Anchor.center,
            angle: direction == 'left' ? 3.14 : 0,
            scale: Vector2.all(2.5));

  @override
  Future<void> onLoad() async {
    var a = await Sprite.load('Free/Menu/Buttons/Play.png');
    sprite = a;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    var aaw = game.ccomp.viewfinder.position;
    position = startPosition + aaw;
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    print('tapped');
    player.horizontalDirection = direction == 'left' ? -1 : 1;
    if (direction == 'right') {
      if (!player.facingRight) {
        player.flipHorizontally();
        player.facingRight = true;
      }
    } else if (direction == 'left') {
      if (player.facingRight) {
        player.flipHorizontally();
        player.facingRight = false;
      }
    }

    player.current = PlayerState.running;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    player.horizontalDirection = 0;

    player.current = PlayerState.idle;
    super.onTapUp(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    player.horizontalDirection = 0;
    player.current = PlayerState.idle;
    super.onTapCancel(event);
  }
}

class JumpScreen extends PositionComponent
    with TapCallbacks, HasGameRef<CollisionApp> {
  Player player;
  JumpScreen({required this.player}) : super();

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    position = Vector2(game.size.x * 1 / 3, 0);
    size = Vector2(game.size.x, game.size.y);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    var startPosition = Vector2(game.size.x * 2 / 4, 0);
    var aaw = game.ccomp.viewfinder.position;
    position = startPosition + aaw;
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    player.jumped = true;
    super.onTapDown(event);
  }
}
