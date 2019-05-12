package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowLinkEvent extends WindowEvent 
    {
        public static const WINDOW_EVENT_LINK:String = "WE_LINK";
        private static const POOL:Array = [];

        private var _link:String;

        public function WindowLinkEvent()
        {
            _type = WINDOW_EVENT_LINK;
        }

        public static function allocate(link:String, window:IWindow, related:IWindow):WindowEvent
        {
            var event:WindowLinkEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowLinkEvent)());
            event._link = link;
            event._window = window;
            event._related = related;
            event._recycled = false;
            event._pool = POOL;
            return event;
        }


        public function get link():String
        {
            return this._link;
        }

        override public function clone():WindowEvent
        {
            return allocate(this._link, window, related);
        }

        override public function toString():String
        {
            return ((((((("WindowLinkEvent { type: " + _type) + " link: ") + this.link) + " cancelable: ") + _cancelable) + " window: ") + window) + " }";
        }
    }
}
