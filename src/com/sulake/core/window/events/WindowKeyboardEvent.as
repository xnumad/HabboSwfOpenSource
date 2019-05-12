package com.sulake.core.window.events
{
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import com.sulake.core.window.IWindow;

    public class WindowKeyboardEvent extends WindowEvent 
    {
        public static const WINDOW_EVENT_KEY_UP:String = "WKE_KEY_UP";
        public static const WINDOW_EVENT_KEY_DOWN:String = "WKE_KEY_DOWN";
        private static const POOL:Array = [];

        private var _event:KeyboardEvent;

        public static function allocate(type:String, event:Event, window:IWindow, related:IWindow, cancelable:Boolean=false):WindowKeyboardEvent
        {
            var keyboardEvent:WindowKeyboardEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowKeyboardEvent)());
            keyboardEvent._type = type;
            keyboardEvent._event = (event as KeyboardEvent);
            keyboardEvent._window = window;
            keyboardEvent._related = related;
            keyboardEvent._recycled = false;
            keyboardEvent._cancelable = cancelable;
            keyboardEvent._pool = POOL;
            return keyboardEvent;
        }

        public function get charCode():uint
        {
            return this._event.charCode;
        }

        public function get keyCode():uint
        {
            return this._event.keyCode;
        }

        public function get keyLocation():uint
        {
            return this._event.keyLocation;
        }

        public function get altKey():Boolean
        {
            return this._event.altKey;
        }

        public function get shiftKey():Boolean
        {
            return this._event.shiftKey;
        }

        public function get ctrlKey():Boolean
        {
            return this._event.ctrlKey;
        }

        override public function clone():WindowEvent
        {
            return allocate(_type, this._event, window, related, cancelable);
        }

        override public function toString():String
        {
            return ((((((("WindowKeyboardEvent { type: " + _type) + " cancelable: ") + _cancelable) + " window: ") + window) + " charCode: ") + this.charCode) + " }";
        }
    }
}
