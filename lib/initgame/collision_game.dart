import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flame/events.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:newwebsite/initgame/arrow_hud.dart';
import 'package:newwebsite/initgame/joystick.dart';

import './collide_block.dart';
import './player.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';

class CollisionApp extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  void Function() initFalse;
  CollisionApp(this.initFalse);

  @override
  Color backgroundColor() {
    return Color(0x00009000);
  }

  late final CameraComponent ccomp;
  late Level lvl;
  @override
  FutureOr<void> onLoad() async {
    lvl = Level(
      initFalse,
    );
    ccomp = CameraComponent.withFixedResolution(
        width: 800, height: 400, world: lvl, hudComponents: []);
    ccomp.viewfinder.anchor = Anchor.topLeft;

    await addAll([
      ccomp,
      lvl,
    ]);
    return super.onLoad();
  }
}

class Level extends World with HasGameRef<CollisionApp> {
  // Level():
  late TiledComponent level;
  final void Function() initFalse;
  // JsCom joystick;
  double gameHorizontal = 0.0;
  Level(this.initFalse, {final joystick});

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('lvl01.tmx', Vector2.all(16));
    final spawnpoint = level.tileMap.getLayer<ObjectGroup>('Spawnpoint');
    final collider = level.tileMap.getLayer<ObjectGroup>('hitboxes');

    add(level);
    add(CollideBlock(Vector2(level.width * 6.75 / 8, level.height * 6.5 / 8)));

    add(TeksCom(position: Vector2(1024 / 2, (400 * 1 / 3) - 50)));

    for (var e in spawnpoint!.objects) {
      switch (e.class_) {
        case 'spawn':
          break;
        case 'spawnbox':
          final player = Player(initFalse, Vector2(e.x, e.y));
          add(player);
          add(Arrow(
              player: player,
              direction: 'left',
              startPosition: Vector2.all(120)));
          add(Arrow(
              player: player,
              direction: 'right',
              startPosition: Vector2(176, 120)));
          add(JumpScreen(player: player));
          break;
        default:
      }
    }
    for (var bruak in collider!.objects) {
      switch (bruak.class_) {
        case 'tabrak':
          add(Tabrakable(
              Vector2(bruak.width, bruak.height), Vector2(bruak.x, bruak.y)));
          break;
        default:
      }
    }

    return super.onLoad();
  }
}

class Tabrakable extends PositionComponent {
  Tabrakable(size, position)
      : super(
          position: position,
          size: size,
        );
  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }

  @override
  // TODO: implement debugMode
  bool get debugMode => false;
}

class TeksCom extends TextComponent {
  TeksCom({Vector2? position})
      : super(
          text: 'Move =>',
          anchor: Anchor.center,
          textRenderer: TextPaint(
              style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                    )
                  ],
                  fontSize: 48)),
          size: Vector2.all(148),
          position: position,
        );
}

class Joycom extends Component {
  JoystickComponent joystick;
  Joycom(this.joystick);
  @override
  FutureOr<void> onLoad() {
    add(joystick);
    return super.onLoad();
  }
}
