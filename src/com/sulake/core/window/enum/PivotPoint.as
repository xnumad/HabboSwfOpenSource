package com.sulake.core.window.enum
{
    public class PivotPoint 
    {
        public static const TOP_LEFT:uint = 0;
        public static const TOP_CENTER:uint = 1;
        public static const TOP_RIGHT:uint = 2;
        public static const CENTER_LEFT:uint = 3;
        public static const CENTER:uint = 4;
        public static const CENTER_RIGHT:uint = 5;
        public static const BOTTOM_LEFT:uint = 6;
        public static const BOTTOM_CENTER:uint = 7;
        public static const BOTTOM_RIGHT:uint = 8;
        public static const PIVOT_NAMES:Array = ["top left", "top center", "top right", "center left", "center", "center right", "bottom left", "bottom center", "bottom right"];

        public static function pivotFromName(name:String):uint
        {
            return PIVOT_NAMES.indexOf(name);
        }
    }
}
