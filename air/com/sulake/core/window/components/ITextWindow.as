//com.sulake.core.window.components.ITextWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;
    import flash.text.TextFormat;
    import com.sulake.core.window.utils.IMargins;
    import com.sulake.core.window.utils.TextStyle;
    import flash.text.StyleSheet;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import flash.text.TextLineMetrics;

    public /*dynamic*/ interface ITextWindow extends IWindow, IScrollableWindow {

        function get antiAliasType():String;
        function get autoSize():String;
        function get bold():Boolean;
        function get border():Boolean;
        function get borderColor():uint;
        function get bottomScrollV():int;
        function get defaultTextFormat():TextFormat;
        function get embedFonts():Boolean;
        function get fontFace():String;
        function get fontSize():uint;
        function get gridFitType():String;
        function get htmlText():String;
        function get italic():Boolean;
        function get kerning():Boolean;
        function get length():int;
        function get margins():IMargins;
        function get maxChars():int;
        function get multiline():Boolean;
        function get numLines():int;
        function get sharpness():Number;
        function get spacing():Number;
        function get text():String;
        function get textColor():uint;
        function get textBackground():Boolean;
        function get textBackgroundColor():uint;
        function get textHeight():Number;
        function get textWidth():Number;
        function get textStyle():TextStyle;
        function get thickness():Number;
        function get underline():Boolean;
        function get wordWrap():Boolean;
        function get etchingColor():uint;
        function get etchingPosition():String;
        function set antiAliasType(k:String):void;
        function set autoSize(k:String):void;
        function set bold(k:Boolean):void;
        function set border(k:Boolean):void;
        function set borderColor(k:uint):void;
        function set defaultTextFormat(k:TextFormat):void;
        function set embedFonts(k:Boolean):void;
        function set fontFace(k:String):void;
        function set fontSize(k:uint):void;
        function set gridFitType(k:String):void;
        function set htmlText(k:String):void;
        function set italic(k:Boolean):void;
        function set kerning(k:Boolean):void;
        function set maxChars(k:int):void;
        function set multiline(k:Boolean):void;
        function set sharpness(k:Number):void;
        function set spacing(k:Number):void;
        function set text(k:String):void;
        function set textColor(k:uint):void;
        function set textBackground(k:Boolean):void;
        function set textBackgroundColor(k:uint):void;
        function set textStyle(k:TextStyle):void;
        function set thickness(k:Number):void;
        function set underline(k:Boolean):void;
        function set wordWrap(k:Boolean):void;
        function set etchingColor(k:uint):void;
        function set etchingPosition(k:String):void;
        function set styleSheet(k:StyleSheet):void;
        function appendText(k:String):void;
        function getCharBoundaries(k:int):Rectangle;
        function getCharIndexAtPoint(k:Number, _arg_2:Number):int;
        function getFirstCharInParagraph(k:int):int;
        function getImageReference(k:String):DisplayObject;
        function getLineIndexAtPoint(k:Number, _arg_2:Number):int;
        function getLineIndexOfChar(k:int):int;
        function getLineLength(k:int):int;
        function getLineMetrics(k:int):TextLineMetrics;
        function getLineOffset(k:int):int;
        function getLineText(k:int):String;
        function getParagraphLength(k:int):int;
        function getTextFormat(k:int=-1, _arg_2:int=-1):TextFormat;
        function replaceText(k:int, _arg_2:int, _arg_3:String):void;
        function setTextFormat(k:TextFormat, _arg_2:int=-1, _arg_3:int=-1):void;
        function resetExplicitStyle():void;

    }
}//package com.sulake.core.window.components

