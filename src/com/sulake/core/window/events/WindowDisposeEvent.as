package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowDisposeEvent extends WindowEvent 
    {
        public static const DISPOSED:String = "WINDOW_DISPOSE_EVENT";
        private static const POOL:Array = [];

        public function WindowDisposeEvent()
        {
            _type = DISPOSED;
        }

        public static function allocate(window:IWindow):WindowDisposeEvent
        {
            var event:WindowDisposeEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowDisposeEvent)());
            event._window = window;
            event._recycled = false;
            event._pool = POOL;
            return event;
        }


        override public function clone():WindowEvent
        {
            return allocate(_window);
        }

        override public function toString():String
        {
            return ((("WindowDisposeEvent { type: " + _type) + " window: ") + _window) + " }";
        }
    }
}
