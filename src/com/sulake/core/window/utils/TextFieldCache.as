package com.sulake.core.window.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.FontStyle;
    import flash.text.AntiAliasType;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.utils.FontEnum;

    public class TextFieldCache implements IDisposable 
    {
        private static var _Str_9479:Map = new Map();
        private static var _Str_1229:TextFieldCache = new (TextFieldCache)();

        private var _disposed:Boolean = false;

        public function TextFieldCache()
        {
            if (_Str_1229 == null)
            {
                TextStyleManager.events.addEventListener(Event.CHANGE, this._Str_6721);
            }
        }

        public static function _Str_17336(k:TextStyle):TextField
        {
            var _local_2:TextField = _Str_9479[k.name];
            if (_local_2)
            {
                return _local_2;
            }
            _local_2 = new TextField();
            var _local_3:TextFormat = _local_2.defaultTextFormat;
            if (!k)
            {
                k = TextStyleManager.getStyle(TextStyleManager.REGULAR);
            }
            _local_3.font = k.fontFamily;
            _local_3.size = k.fontSize;
            _local_3.color = k.color;
            _local_3.bold = ((k.fontWeight == FontStyle.BOLD) ? true : null);
            _local_3.italic = ((k.fontStyle == FontStyle.ITALIC) ? true : null);
            _local_3.underline = ((k.textDecoration == TextStyle.UNDERLINE) ? true : null);
            _local_3.indent = k.textIndent;
            _local_3.leading = k.leading;
            _local_3.kerning = k.kerning;
            _local_3.letterSpacing = k.letterSpacing;
            _local_2.antiAliasType = ((k.antiAliasType == AntiAliasType.ADVANCED) ? AntiAliasType.ADVANCED : AntiAliasType.NORMAL);
            _local_2.sharpness = ((k.sharpness) ? (k.sharpness as int) : 0);
            _local_2.thickness = ((k.thickness) ? (k.thickness as int) : 0);
            if (!k.fontWeight)
            {
                _local_3.bold = false;
            }
            if (!k.fontStyle)
            {
                _local_3.italic = false;
            }
            if (!k.textDecoration)
            {
                _local_3.underline = false;
            }
            if (!k.textIndent)
            {
                _local_3.indent = 0;
            }
            if (!k.leading)
            {
                _local_3.leading = 0;
            }
            if (!k.kerning)
            {
                _local_3.kerning = false;
            }
            if (!k.letterSpacing)
            {
                _local_3.letterSpacing = 0;
            }
            if (!k.antiAliasType)
            {
                _local_2.antiAliasType = AntiAliasType.NORMAL;
            }
            _local_2.autoSize = TextFieldAutoSize.LEFT;
            _local_2.setTextFormat(_local_3);
            _local_2.embedFonts = FontEnum.isEmbeddedFont(_local_3.font);
            _local_2.defaultTextFormat = _local_3;
            _Str_9479[k.name] = _local_2;
            return _local_2;
        }

        public static function _Str_24073(k:String):TextField
        {
            var _local_2:TextStyle = TextStyleManager.getStyle(k);
            if (!_local_2)
            {
                return null;
            }
            return _Str_17336(_local_2);
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            TextStyleManager.events.removeEventListener(Event.CHANGE, this._Str_6721);
            _Str_9479.reset();
            _Str_1229 = null;
            this._disposed = true;
        }

        private function _Str_6721(k:Event):void
        {
            _Str_9479.reset();
        }
    }
}
