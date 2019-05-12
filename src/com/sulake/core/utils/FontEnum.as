package com.sulake.core.utils
{
    import flash.text.Font;
    import flash.utils.getQualifiedClassName;

    public class FontEnum 
    {
        private static const _systemFonts:Map = new Map();
        private static const _embeddedFonts:Map = new Map();
        private static var _init:Boolean = false;

        {
            init();
        }


        public static function isSystemFont(font:String):Boolean
        {
            return !(_systemFonts.getValue(font) == null);
        }

        public static function isEmbeddedFont(font:String):Boolean
        {
            return !(_embeddedFonts.getValue(font) == null);
        }

        public static function get systemFonts():Map
        {
            return _systemFonts;
        }

        public static function get embeddedFonts():Map
        {
            return _embeddedFonts;
        }

        public static function registerFont(f:Class):Font
        {
            var font:Font;
            Font.registerFont((f as Class));
            var name:String = getQualifiedClassName(f);
            var allFonts:Array = Font.enumerateFonts(false);
            var index:int = allFonts.length;
            while (index > 0)
            {
                font = allFonts[(index - 1)];
                if (getQualifiedClassName(font) == name)
                {
                    break;
                }
                index--;
            }
            _embeddedFonts.add(font.fontName, font);
            return font;
        }

        private static function init():void
        {
            var deviceFonts:Array;
            var embeddedFonts:Array;
            var font:Font;
            if (!_init)
            {
                deviceFonts = Font.enumerateFonts(true);
                embeddedFonts = Font.enumerateFonts(false);
                for each (font in deviceFonts)
                {
                    if (embeddedFonts.indexOf(font) == -1)
                    {
                        _systemFonts.add(font.fontName, font);
                    }
                }
                _init = true;
            }
        }

        public static function refresh():void
        {
			try
			{
				var systemFont:Font;
				var embeddedFont:Font;
				var systemFonts:Array = Font.enumerateFonts(false);
				var index:int;
				while (index < systemFonts.length)
				{
					systemFont = systemFonts[index];
					embeddedFont = _embeddedFonts.getValue(systemFont.fontName);
					if ((((!(embeddedFont)) || (!(embeddedFont.fontType == systemFont.fontType))) || (!(embeddedFont.fontStyle == systemFont.fontStyle))))
					{
						_embeddedFonts.add(systemFont.fontName, systemFont);
					};
					index++;
				};
			}
			catch (error:Error)
			{
				Habbo.trackLoginStep("Error in FontEnum.refresh(): " + error.message + ", Stacktrace: " + error.getStackTrace());
			}
        }
    }
}
