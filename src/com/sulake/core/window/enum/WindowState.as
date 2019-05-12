package com.sulake.core.window.enum
{
    public class WindowState 
    {
        public static const DEFAULT:uint = (0 << 0);
        public static const ACTIVE:uint = (1 << 0);
        public static const FOCUSED:uint = (1 << 1);
        public static const HOVERING:uint = (1 << 2);
        public static const SELECTED:uint = (1 << 3);
        public static const PRESSED:uint = (1 << 4);
        public static const DISABLED:uint = (1 << 5);
        public static const LOCKED:uint = (1 << 6);
        public static const DISPOSED:uint = (1 << 30);
    }
}
