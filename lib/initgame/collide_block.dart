import 'dart:async';
import 'dart:ui';

import './collision_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class CollideBlock extends CircleComponent with HasGameRef<CollisionApp> {
  CollideBlock(pos) : super(position: pos);
  bool scaled = false;
  @override
  Future<void> onLoad() {
    var paints = Paint();
    paints.color = Color.fromARGB(255, 200, 100, 50);
    paint = paints;
    size = Vector2.all(42);
    // radius = 48;
    paint = paints;
    // position = Vector2(gameRef.size.x * 3 / 4, gameRef.size.y / 2);
    anchor = Anchor.center;

    add(RectangleHitbox(collisionType: CollisionType.passive));
    return super.onLoad();
  }
  // FutureOr<void> onLoad() {
  //   var paints = Paint();
  //   paints.color = Color.fromARGB(255, 200, 100, 50);
  //   var circ = CircleComponent(
  //       radius: 48,
  //       paint: paints,
  //       position: Vector2(gameRef.size.x * 2 / 3, gameRef.size.y / 2),
  //       anchor: Anchor.center);

  //   add(circ);

  //   add(RectangleHitbox(collisionType: CollisionType.passive));
  //   return super.onLoad();
  // }
}
