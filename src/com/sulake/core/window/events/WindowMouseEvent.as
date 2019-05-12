package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowMouseEvent extends WindowEvent 
    {
        public static const CLICK:String = "WME_CLICK";
        public static const DOUBLE_CLICK:String = "WME_DOUBLE_CLICK";
        public static const DOWN:String = "WME_DOWN";
        public static const MIDDLE_CLICK:String = "WME_MIDDLE_CLICK";
        public static const MIDDLE_DOWN:String = "WME_MIDDLE_DOWN";
        public static const MIDDLE_UP:String = "WME_MIDDLE_UP";
        public static const MOVE:String = "WME_MOVE";
        public static const OUT:String = "WME_OUT";
        public static const OVER:String = "WME_OVER";
        public static const UP:String = "WME_UP";
        public static const UP_OUTSIDE:String = "WME_UP_OUTSIDE";
        public static const WHEEL:String = "WME_WHEEL";
        public static const RIGHT_CLICK:String = "WME_RIGHT_CLICK";
        public static const RIGHT_DOWN:String = "WME_RIGHT_DOWN";
        public static const RIGHT_UP:String = "WME_RIGHT_UP";
        public static const ROLL_OUT:String = "WME_ROLL_OUT";
        public static const ROLL_OVER:String = "WME_ROLL_OVER";
        public static const HOVERING:String = "WME_HOVERING";
        private static const POOL:Array = [];

        public var delta:int;
        public var localX:Number;
        public var localY:Number;
        public var stageX:Number;
        public var stageY:Number;
        public var altKey:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        public var buttonDown:Boolean;


        public static function allocate(type:String, window:IWindow, related:IWindow, localX:Number, localY:Number, stageX:Number, stageY:Number, altKey:Boolean, ctrlKey:Boolean, shiftKey:Boolean, buttonDown:Boolean, delta:int):WindowMouseEvent
        {
            var event:WindowMouseEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowMouseEvent)());
            event._type = type;
            event._window = window;
            event._related = related;
            event._recycled = false;
            event._pool = POOL;
            event.localX = localX;
            event.localY = localY;
            event.stageX = stageX;
            event.stageY = stageY;
            event.altKey = altKey;
            event.ctrlKey = ctrlKey;
            event.shiftKey = shiftKey;
            event.buttonDown = buttonDown;
            event.delta = delta;
            return event;
        }


        override public function clone():WindowEvent
        {
            return allocate(_type, window, related, this.localX, this.localY, this.stageX, this.stageY, this.altKey, this.ctrlKey, this.shiftKey, this.buttonDown, this.delta);
        }

        override public function toString():String
        {
            return ((((((((("WindowMouseEvent { type: " + _type) + " cancelable: ") + _cancelable) + " window: ") + window) + " localX: ") + this.localX) + " localY: ") + this.localY) + " }";
        }
    }
}
