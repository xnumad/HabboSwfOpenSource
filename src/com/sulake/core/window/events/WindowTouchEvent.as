package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowTouchEvent extends WindowEvent 
    {
        public static const WTE_BEGIN:String = "WTE_BEGIN";
        public static const WTE_END:String = "WTE_END";
        public static const WTE_MOVE:String = "WTE_MOVE";
        public static const WTE_OUT:String = "WTE_OUT";
        public static const WTE_OVER:String = "WTE_OVER";
        public static const WTE_ROLL_OUT:String = "WTE_ROLL_OUT";
        public static const WTE_ROLL_OVER:String = "WTE_ROLL_OVER";
        public static const WTE_TAP:String = "WTE_TAP";
        private static const POOL:Array = [];

        public var localX:Number;
        public var localY:Number;
        public var stageX:Number;
        public var stageY:Number;
        public var altKey:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        public var pressure:Number;
        public var sizeX:Number;
        public var sizeY:Number;


        public static function allocate(type:String, window:IWindow, related:IWindow, localX:Number, localY:Number, sizeX:Number, sizeY:Number, stageX:Number, stageY:Number, pressure:Number, altKey:Boolean, ctrlKey:Boolean, shiftKey:Boolean):WindowTouchEvent
        {
            var touchEvent:WindowTouchEvent;
            touchEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowTouchEvent)());
            touchEvent._type = type;
            touchEvent._window = window;
            touchEvent._related = related;
            touchEvent._recycled = false;
            touchEvent._pool = POOL;
            touchEvent.sizeX = sizeX;
            touchEvent.sizeY = sizeY;
            touchEvent.localX = localX;
            touchEvent.localY = localY;
            touchEvent.stageX = stageX;
            touchEvent.stageY = stageY;
            touchEvent.pressure = pressure;
            touchEvent.altKey = altKey;
            touchEvent.ctrlKey = ctrlKey;
            touchEvent.shiftKey = shiftKey;
            return touchEvent;
        }


        override public function clone():WindowEvent
        {
            return allocate(_type, window, related, this.localX, this.localY, this.sizeX, this.sizeY, this.stageX, this.stageY, this.pressure, this.altKey, this.ctrlKey, this.shiftKey);
        }

        override public function toString():String
        {
            return ((((((((("WindowTouchEvent { type: " + _type) + " cancelable: ") + _cancelable) + " window: ") + window) + " localX: ") + this.localX) + " localY: ") + this.localY) + " }";
        }
    }
}
