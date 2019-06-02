package com.sulake.core.window.utils
{
    import com.sulake.core.utils.Map;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.events.Event;
    import flash.text.StyleSheet;

    public class TextStyleManager 
    {
        public static const REGULAR:String = "regular";
        public static const ITALIC:String = "italic";
        public static const BOLD:String = "bold";
        private static var _styleSheetMap:Map;
        private static var _styleSheetNames:Array;
        private static var _eventDispatcher:IEventDispatcher;
        private static const TAG_OPEN:String = "{";
        private static const TAG_CLOSE:String = "}";
        private static const CMT_OPEN:String = "/*";
        private static const CMT_CLOSE:String = "*/";

        {
            init();
        }


        public static function get events():IEventDispatcher
        {
            return _eventDispatcher;
        }

        private static function init():void
        {
            var textStyle:TextStyle;
            _styleSheetMap = new Map();
            _styleSheetNames = new Array();
            _eventDispatcher = new EventDispatcherWrapper();
            textStyle = new TextStyle();
            textStyle.name = REGULAR;
            textStyle.color = 0;
            textStyle.fontSize = "9";
            textStyle.fontFamily = "Courier";
            textStyle.fontStyle = "normal";
            textStyle.fontWeight = "normal";
            _styleSheetMap[textStyle.name] = textStyle;
            _styleSheetNames.push(textStyle.name);
            textStyle = new TextStyle();
            textStyle.name = ITALIC;
            textStyle.color = 0;
            textStyle.fontSize = "9";
            textStyle.fontFamily = "Courier";
            textStyle.fontStyle = "italic";
            textStyle.fontWeight = "normal";
            _styleSheetMap[textStyle.name] = textStyle;
            _styleSheetNames.push(textStyle.name);
            textStyle = new TextStyle();
            textStyle.name = BOLD;
            textStyle.color = 0;
            textStyle.fontSize = "9";
            textStyle.fontFamily = "Courier";
            textStyle.fontStyle = "normal";
            textStyle.fontWeight = "bold";
            _styleSheetMap[textStyle.name] = textStyle;
            _styleSheetNames.push(textStyle.name);
        }

        public static function getStyle(k:String):TextStyle
        {
            return _styleSheetMap[k];
        }

        public static function getStyleWithIndex(k:int):TextStyle
        {
            return _styleSheetMap.getWithIndex(k);
        }

        public static function setStyle(k:String, _arg_2:TextStyle):void
        {
            var _local_3:* = (!(_styleSheetMap.hasKey(k)));
            _arg_2.name = k;
            _styleSheetMap[k] = _arg_2;
            if (_local_3)
            {
                _styleSheetNames.push(k);
                _eventDispatcher.dispatchEvent(new Event(Event.ADDED));
            }
            else
            {
                _eventDispatcher.dispatchEvent(new Event(Event.CHANGE));
            }
        }

        public static function setStyles(k:Array, _arg_2:Boolean=false):void
        {
            var _local_4:TextStyle;
            var _local_5:Array;
            if (_arg_2)
            {
                _local_5 = [_styleSheetMap[REGULAR], _styleSheetMap[ITALIC], _styleSheetMap[BOLD]];
                _styleSheetMap.reset();
                _styleSheetMap[REGULAR] = _local_5[0];
                _styleSheetMap[ITALIC] = _local_5[1];
                _styleSheetMap[BOLD] = _local_5[2];
            }
            var _local_3:int = _styleSheetMap.length;
            for each (_local_4 in k)
            {
                _styleSheetMap[_local_4.name] = _local_4;
                if (_styleSheetNames.indexOf(_local_4.name) == -1)
                {
                    _styleSheetNames.push(_local_4.name);
                }
            }
            _eventDispatcher.dispatchEvent(new Event(Event.CHANGE));
            if (_styleSheetMap.length != _local_3)
            {
                _eventDispatcher.dispatchEvent(new Event(Event.ADDED));
            }
        }

        public static function findMatchingTextStyle(k:String):TextStyle
        {
            var _local_3:TextStyle;
            var _local_2:TextStyle = (parseCSS(k)[0] as TextStyle);
            if (_local_2)
            {
                _local_3 = _styleSheetMap[_local_2.name];
                if (((_local_3) && (_local_3.equals(_local_2))))
                {
                    return _local_3;
                }
            }
            return null;
        }

        public static function enumerateStyles():Array
        {
            var k:Array = new Array();
            var _local_2:int = _styleSheetMap.length;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                k.push(_styleSheetMap.getWithIndex(_local_3));
                _local_3++;
            }
            return k;
        }

        public static function enumerateStyleNames():Array
        {
            return _styleSheetMap.getKeys();
        }

        public static function getStyleNameArrayRef():Array
        {
            return _styleSheetNames;
        }

        public static function parseCSS(k:String):Array
        {
            var _local_5:Object;
            var _local_6:TextStyle;
            var _local_7:String;
            var _local_2:StyleSheet = new StyleSheet();
            _local_2.parseCSS(k);
            var _local_3:Array = parseStyleNamesFromCSS(k);
            var _local_4:Array = new Array();
            for each (_local_7 in _local_3)
            {
                _local_5 = _local_2.getStyle(_local_7);
                _local_6 = new TextStyle();
                _local_6.name = _local_7;
                _local_6.color = ((_local_5.color) ? uint(String(_local_5.color).replace("#", "0x")) : null);
                _local_6.fontFamily = ((_local_5.fontFamily) ? _local_5.fontFamily : null);
                _local_6.fontSize = ((_local_5.fontSize) ? parseInt(String(_local_5.fontSize)) : null);
                _local_6.fontStyle = ((_local_5.fontStyle) ? _local_5.fontStyle : null);
                _local_6.fontWeight = ((_local_5.fontWeight) ? _local_5.fontWeight : null);
                _local_6.kerning = ((_local_5.kerning) ? (_local_5.kerning == "true") : null);
                _local_6.leading = ((_local_5.leading) ? parseInt(String(_local_5.leading)) : null);
                _local_6.letterSpacing = ((_local_5.letterSpacing) ? parseInt(_local_5.letterSpacing.toString()) : null);
                _local_6.textDecoration = ((_local_5.textDecoration) ? _local_5.textDecoration : null);
                _local_6.textIndent = ((_local_5.textIndent) ? parseInt(_local_5.textIndent.toString()) : null);
                _local_6.antiAliasType = ((_local_5.antiAliasType) ? _local_5.antiAliasType : null);
                _local_6.sharpness = ((_local_5.sharpness) ? parseInt(_local_5.sharpness) : null);
                _local_6.thickness = ((_local_5.thickness) ? parseInt(_local_5.thickness) : null);
                _local_6.etchingColor = ((_local_5.etchingColor) ? uint(String(_local_5.etchingColor).replace("#", "0x")) : null);
                _local_6.etchingPosition = ((_local_5.etchingPosition) ? String(_local_5.etchingPosition) : null);
                _local_4.push(_local_6);
            }
            return _local_4;
        }

        private static function parseStyleNamesFromCSS(k:String):Array
        {
            var _local_5:String;
            var _local_2:Array = [];
            var _local_3:String = k;
            _local_3 = _local_3.split("\t").join("");
            _local_3 = _local_3.split("\n").join("");
            _local_3 = _local_3.split("\r").join("");
            var _local_4:Array = _local_3.split(TAG_CLOSE);
            if (countSubStrings(k, TAG_OPEN) != countSubStrings(k, TAG_CLOSE))
            {
                throw (new Error((((('Mismatching amount of "' + TAG_OPEN) + '" versus "') + TAG_CLOSE) + '", please check the CSS!')));
            }
            for each (_local_5 in _local_4)
            {
                while (true)
                {
                    if (_local_5.indexOf(CMT_OPEN) == 0)
                    {
                        _local_5 = _local_5.substring((_local_5.indexOf(CMT_CLOSE) + 2), _local_5.length);
                    }
                    else
                    {
                        break;
                    }
                }
                _local_5 = _local_5.slice(0, _local_5.indexOf(TAG_OPEN)).split(" ").join("");
                if (_local_5.length)
                {
                    _local_2.push(_local_5);
                }
            }
            return _local_2;
        }

        private static function countSubStrings(k:String, _arg_2:String):int
        {
            var _local_3:int;
            var _local_4:int;
            while ((_local_4 = k.indexOf(_arg_2, _local_4)) != -1)
            {
                _local_4++;
                _local_3++;
            }
            return _local_3;
        }

        public static function toString():String
        {
            var _local_3:TextStyle;
            var k:Array = enumerateStyles();
            var _local_2:String = "";
            for each (_local_3 in k)
            {
                _local_2 = (_local_2 + (_local_3.toString() + "\n\n"));
            }
            return _local_2;
        }
    }
}
