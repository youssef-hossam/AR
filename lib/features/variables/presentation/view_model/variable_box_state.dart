enum VariableBoxState {
  /// Waiting for the camera permission / AR session.
  idle,

  /// Camera permission was refused.
  permissionDenied,

  /// The box is on screen with its lid closed.
  closed,

  /// Lid animation is running.
  opening,

  /// The 3D model inside the box is visible.
  opened,
}
