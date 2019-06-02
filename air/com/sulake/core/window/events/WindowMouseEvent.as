//com.sulake.core.window.events.WindowMouseEvent

package com.sulake.core.window.events{
    import com.sulake.core.window.IWindow;

    public class WindowMouseEvent extends WindowEvent {

        public static const CLICK:String;
        public static const DOUBLE_CLICK:String;
        public static const DOWN:String;
        public static const MIDDLE_CLICK:String;
        public static const MIDDLE_DOWN:String;
        public static const MIDDLE_UP:String;
        public static const MOVE:String;
        public static const OUT:String;
        public static const OVER:String;
        public static const UP:String;
        public static const UP_OUTSIDE:String;
        public static const WHEEL:String;
        public static const RIGHT_CLICK:String;
        public static const RIGHT_DOWN:String;
        public static const RIGHT_UP:String;
        public static const ROLL_OUT:String;
        public static const ROLL_OVER:String;
        public static const HOVERING:String;
        private static const POOL:Array;

        public var delta:int;
        public var localX:Number;
        public var localY:Number;
        public var stageX:Number;
        public var stageY:Number;
        public var altKey:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        public var buttonDown:Boolean;

        public function WindowMouseEvent();

        public static function allocate(k:String, _arg_2:IWindow, _arg_3:IWindow, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Boolean, _arg_9:Boolean, k0:Boolean, k1:Boolean, k2:int):WindowMouseEvent;


        override public function clone():WindowEvent;

        override public function toString():String;


    }
}//package com.sulake.core.window.events

