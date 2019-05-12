package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowMessage extends WindowEvent 
    {
        private static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
        private static const POOL:Array = [];

        public var message:String;

        public function WindowMessage()
        {
            _type = WINDOW_EVENT_MESSAGE;
        }

        public static function allocate(message:String, window:IWindow, related:IWindow, cancelable:Boolean=false):WindowEvent
        {
            var windowMessage:WindowMessage = ((POOL.length > 0) ? POOL.pop() : new (WindowMessage)());
            windowMessage.message = message;
            windowMessage._window = window;
            windowMessage._related = related;
            windowMessage._cancelable = cancelable;
            windowMessage._recycled = false;
            windowMessage._pool = POOL;
            return windowMessage;
        }

        override public function clone():WindowEvent
        {
            return allocate(this.message, window, related, cancelable);
        }

        override public function toString():String
        {
            return ((((((("WindowLinkEvent { type: " + _type) + " message: ") + this.message) + " cancelable: ") + _cancelable) + " window: ") + window) + " }";
        }
    }
}
