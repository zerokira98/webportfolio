import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import './collide_block.dart';
import './collision_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<CollisionApp>, CollisionCallbacks, KeyboardHandler {
  void Function() initFalse;
  var horizontalDirection = 0;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runAnimation;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 120;
  final Vector2 fromAbove = Vector2(0, -1);
  bool isOnGround = false;
  bool facingRight = true;
  bool jumped = false;
  double gravity = 20;
  final double jumpSpeed = 320;
  final double terminalVelocity = 160;

  bool hasJumped = false;
  Player(this.initFalse, Vector2 position)
      : super(
          anchor: Anchor.center,
          position: position,
          size: Vector2.all(32.0),
        );

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    current = PlayerState.idle;
    horizontalDirection = 0;
    // print(keysPressed);
    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      jumped = true;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      current = PlayerState.running;
      if (facingRight) {
        flipHorizontally();
        facingRight = false;
      }
      horizontalDirection += -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      if (!facingRight) {
        flipHorizontally();
        facingRight = true;
      }
      horizontalDirection += 1;

      current = PlayerState.running;
    }
    return true;
  }

  /// Pixels/s
  double maxSpeed = 3.0;

  @override
  FutureOr<void> onLoad() async {
    final image = await gameRef
        .loadSprite('Main Characters/Virtual Guy/Idle (32x32).png');
    final image2 =
        await gameRef.loadSprite('Main Characters/Virtual Guy/Run (32x32).png');

    idleAnimation = SpriteAnimation.fromFrameData(
        image.image,
        SpriteAnimationData.sequenced(
            amount: 11, stepTime: 0.05, textureSize: Vector2.all(32)));
    runAnimation = SpriteAnimation.fromFrameData(
        image2.image,
        SpriteAnimationData.sequenced(
            amount: 12, stepTime: 0.05, textureSize: Vector2.all(32)));
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runAnimation
    };
    current = PlayerState.idle;
    add(RectangleHitbox(collisionType: CollisionType.active));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    // position += Vector2(horizontalDirection * 100 * dt, 0);
    // if (joystick.direction.name.contains("eft")) {
    //   current = PlayerState.running;
    //   if (facingRight) {
    //     flipHorizontally();
    //     facingRight = false;
    //   }
    //   horizontalDirection = -1;
    // } else if (joystick.direction.name.contains("ight")) {
    //   if (!facingRight) {
    //     flipHorizontally();
    //     facingRight = true;
    //   }
    //   horizontalDirection = 1;

    //   current = PlayerState.running;
    // } else if (joystick.direction == JoystickDirection.idle) {
    //   horizontalDirection = 0;
    //   current = PlayerState.idle;
    // }
    // Apply basic gravity
    velocity.y = velocity.y.clamp(-jumpSpeed, terminalVelocity);
    velocity.y += gravity;
    position += velocity * dt;
    if (position.x < 120 || position.x > 340) {
      gameRef.ccomp.stop();
    } else {
      gameRef.ccomp.follow(this,
          maxSpeed: double.infinity, horizontalOnly: true, snap: false);
      gameRef.ccomp.moveBy(Vector2(-120, 0));
    }
// Determine if ember has jumped
    if (jumped) {
      if (isOnGround) {
        velocity.y = -jumpSpeed;
        isOnGround = false;
      }
      jumped = false;
    }

// Prevent ember from jumping to crazy fast as well as descending too fast and
// crashing through the ground or a platform.
    // }
    super.update(dt);
  }

  @override
  void onCollision(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    if (other is Tabrakable) {
      if (other.position.y < position.y + size.y / 2 &&
          other.position.y + other.size.y > position.y + size.y / 2 &&
          position.y < other.y) {
        position.y = -1 + other.y - size.x / 2;
      }
      //from right
      else if (other.position.x + other.size.x > position.x - (size.x / 2) &&
          other.position.x < position.x - (size.x / 2) &&
          position.x + size.x / 2 > other.position.x + other.size.x) {
        position.x = 1 + other.x + other.size.x + (size.x / 2);
        //from left
      } else if (other.position.x < position.x + (size.x / 2) &&
          other.position.x + other.size.x > position.x + (size.x / 2) &&
          position.x - size.x / 2 < other.position.x) {
        position.x = -1 + other.x - (size.x / 2);
      }

      // print(_horizonColl(other));
      // }

      final mid =
          (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) /
              2;
      final collisionNormal = absoluteCenter - mid;
      final separationDistance = (size.y / 2) - collisionNormal.length;

      // collisionNormal.normalize();
      // print(intersectionPoints.elementAt(0));
      // print(intersectionPoints.elementAt(1));
      // If collision normal is almost upwards,
      // ember must be on ground.
      if (fromAbove.dot(collisionNormal) > 0.9) {
        isOnGround = true;
      }

      // Resolve collision by moving ember along
      // collision normal by separation distance.
      if (other.position.y <= position.y + size.y) {
        // position.y = other.position.y - (size.y / 2);
        // position += collisionNormal.scaled(separationDistance);
      } else {
        // position -= size;
        // horizontalDirection = 0;
        // velocity.x = horizontalDirection * moveSpeed;
      }
    }
    if (other is CollideBlock) {
      // print(other.size);
      if (other.scaled == false) {
        other.add(
            ScaleEffect.by(Vector2.all(52), EffectController(duration: 1)));
        other.scaled = true;
        add(ScaleEffect.to(Vector2.all(0.01), EffectController(duration: 1)));
        add(RotateEffect.by(3.14 * 2, EffectController(duration: 1)));
        gravity = 0;
        velocity.y = 2;
        await Future.delayed(Duration(seconds: 1));
        initFalse();
      }
    }
    super.onCollision(intersectionPoints, other);
  }
}

enum PlayerState { idle, running }
