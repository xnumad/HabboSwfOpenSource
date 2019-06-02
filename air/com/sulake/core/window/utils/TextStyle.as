//com.sulake.core.window.utils.TextStyle

package com.sulake.core.window.utils{
    public class TextStyle {

        public static const NORMAL:String;
        public static const ITALIC:String;
        public static const BOLD:String;
        public static const UNDERLINE:String;
        public static const NONE:String;
        public static const ADVANCED:String;
        public static const TOP_LEFT:String;
        public static const TOP:String;
        public static const TOP_RIGHT:String;
        public static const LEFT:String;
        public static const RIGHT:String;
        public static const BOTTOM_LEFT:String;
        public static const BOTTOM:String;
        public static const BOTTOM_RIGHT:String;

        public var name:String;
        public var color:Object;
        public var fontFamily:String;
        public var fontSize:Object;
        public var fontStyle:String;
        public var fontWeight:String;
        public var kerning:Object;
        public var leading:Object;
        public var letterSpacing:Object;
        public var textDecoration:String;
        public var textIndent:Object;
        public var antiAliasType:String;
        public var sharpness:Object;
        public var thickness:Object;
        public var etchingColor:Object;
        public var etchingPosition:Object;

        public function TextStyle();

        public function toString():String;

        public function equals(k:TextStyle):Boolean;

        public function clone():TextStyle;


    }
}//package com.sulake.core.window.utils

