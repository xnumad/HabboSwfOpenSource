package com.sulake.core.window.graphics
{
    public class WindowRedrawFlag 
    {
        public static const UNKNOWN:uint = 0;
        public static const REDRAW:uint = (1 << 0);
        public static const RESIZE:uint = (1 << 1);
        public static const RELOCATE:uint = (1 << 2);
        public static const STATE:uint = (1 << 3);
        public static const BLEND:uint = (1 << 4);
        public static const CASCADE:uint = (1 << 5);
    }
}
