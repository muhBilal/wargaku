import 'dart:ui';

class ClassesCustomColorsHex
{
	final String _main = "#ef5350";
	String get getMain => _main;
	
	final String _mainHover = "#a5d6a7";
	String get getMainHover => _mainHover;
	
	final String _mainOpacity = "#4caf5026";
	String get getMainOpacity => _mainOpacity;

	final String _second = "#ffab91";
	String get getSecond => _second;

	final String _third = "#b0bec5";
	String get getThird => _third;
}

extension HexColor on Color 
{
    static Color fromHex(String hexString) 
    {
        final buffer = StringBuffer();
        if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
        buffer.write(hexString.replaceFirst('#', ''));
        return Color(int.parse(buffer.toString(), radix: 16));
    }

    String toHex({bool leadingHashSign = true}) => 
        '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
}