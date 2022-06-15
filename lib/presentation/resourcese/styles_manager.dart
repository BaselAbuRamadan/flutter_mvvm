import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle (double fontSize,FontWeight fontWeight ,Color color){
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight);
}
// regular style
TextStyle getRegularStyle(
{double fontSize = FontSize.s12, required Color color})  {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
// medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color})  {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color})  {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// Bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color})  {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}