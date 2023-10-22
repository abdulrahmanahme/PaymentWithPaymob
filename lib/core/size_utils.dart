import 'package:flutter/material.dart';

// This is where the magic happens.
// This functions are responsible to make UI responsive across all the mobile devices.

Size size = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
num statusBar =
    MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first).viewPadding.top;
num bottomBar = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first)
    .viewPadding
    .bottom;
// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num figmaDESIGNWIDTH = 375;
const num figmaDESIGNHEIGHT = 812;
const num figmaDESIGNSTATUSBAR = 44;

///This method is used to get device viewport width.
get width {
  return size.width;
}

///This method is used to get device viewport height.
get height {

  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return ((px * width) / figmaDESIGNWIDTH);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return ((px * height) / (figmaDESIGNHEIGHT - figmaDESIGNSTATUSBAR));
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return getSize(px);
}

///This method is used to set padding responsively
EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsDirectional getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsetsDirectional getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsetsDirectional.only(
    start: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    end: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}
