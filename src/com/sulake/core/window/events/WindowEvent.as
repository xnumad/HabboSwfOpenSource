package com.sulake.core.window.events
{
    import com.sulake.core.window.IWindow;

    public class WindowEvent 
    {
        public static const WINDOW_EVENT_DESTROY:String = "WE_DESTROY";
        public static const WINDOW_EVENT_DESTROYED:String = "WE_DESTROYED";
        public static const WINDOW_EVENT_OPEN:String = "WE_OPEN";
        public static const WINDOW_EVENT_OPENED:String = "WE_OPENED";
        public static const WINDOW_EVENT_CLOSE:String = "WE_CLOSE";
        public static const WINDOW_EVENT_CLOSED:String = "WE_CLOSED";
        public static const WINDOW_EVENT_FOCUS:String = "WE_FOCUS";
        public static const WINDOW_EVENT_FOCUSED:String = "WE_FOCUSED";
        public static const WINDOW_EVENT_UNFOCUS:String = "WE_UNFOCUS";
        public static const WINDOW_EVENT_UNFOCUSED:String = "WE_UNFOCUSED";
        public static const WINDOW_EVENT_ACTIVATE:String = "WE_ACTIVATE";
        public static const WINDOW_EVENT_ACTIVATED:String = "WE_ACTIVATED";
        public static const WINDOW_EVENT_DEACTIVATE:String = "WE_DEACTIVATE";
        public static const WINDOW_EVENT_DEACTIVATED:String = "WE_DEACTIVATED";
        public static const WINDOW_EVENT_SELECT:String = "WE_SELECT";
        public static const WINDOW_EVENT_SELECTED:String = "WE_SELECTED";
        public static const WINDOW_EVENT_UNSELECT:String = "WE_UNSELECT";
        public static const WINDOW_EVENT_UNSELECTED:String = "WE_UNSELECTED";
        public static const WINDOW_EVENT_LOCK:String = "WE_LOCK";
        public static const WINDOW_EVENT_LOCKED:String = "WE_LOCKED";
        public static const WINDOW_EVENT_UNLOCK:String = "WE_UNLOCK";
        public static const WINDOW_EVENT_UNLOCKED:String = "WE_UNLOCKED";
        public static const WINDOW_EVENT_ENABLE:String = "WE_ENABLE";
        public static const WINDOW_EVENT_ENABLED:String = "WE_ENABLED";
        public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
        public static const WINDOW_EVENT_DISABLED:String = "WE_DISABLED";
        public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
        public static const WINDOW_EVENT_RELOCATED:String = "WE_RELOCATED";
        public static const WINDOW_EVENT_RESIZE:String = "WE_RESIZE";
        public static const WINDOW_EVENT_RESIZED:String = "WE_RESIZED";
        public static const WINDOW_EVENT_MINIMIZE:String = "WE_MINIMIZE";
        public static const WINDOW_EVENT_MINIMIZED:String = "WE_MINIMIZED";
        public static const WINDOW_EVENT_MAXIMIZE:String = "WE_MAXIMIZE";
        public static const WINDOW_EVENT_MAXIMIZED:String = "WE_MAXIMIZED";
        public static const WINDOW_EVENT_RESTORE:String = "WE_RESTORE";
        public static const WINDOW_EVENT_RESTORED:String = "WE_RESTORED";
        public static const WINDOW_EVENT_CHILD_ADDED:String = "WE_CHILD_ADDED";
        public static const WINDOW_EVENT_CHILD_REMOVED:String = "WE_CHILD_REMOVED";
        public static const WINDOW_EVENT_CHILD_RELOCATED:String = "WE_CHILD_RELOCATED";
        public static const WINDOW_EVENT_CHILD_RESIZED:String = "WE_CHILD_RESIZED";
        public static const WINDOW_EVENT_CHILD_ACTIVATED:String = "WE_CHILD_ACTIVATED";
        public static const WINDOW_EVENT_CHILD_VISIBILITY:String = "WE_CHILD_VISIBILITY";
        public static const WINDOW_EVENT_PARENT_ADDED:String = "WE_PARENT_ADDED";
        public static const WINDOW_EVENT_PARENT_REMOVED:String = "WE_PARENT_REMOVED";
        public static const WINDOW_EVENT_PARENT_RELOCATED:String = "WE_PARENT_RELOCATED";
        public static const WINDOW_EVENT_PARENT_RESIZED:String = "WE_PARENT_RESIZED";
        public static const WINDOW_EVENT_PARENT_ACTIVATED:String = "WE_PARENT_ACTIVATED";
        public static const WINDOW_EVENT_OK:String = "WE_OK";
        public static const WINDOW_EVENT_CANCEL:String = "WE_CANCEL";
        public static const WINDOW_EVENT_CHANGE:String = "WE_CHANGE";
        public static const WINDOW_EVENT_SCROLL:String = "WE_SCROLL";
        public static const UNKNOWN:String = "";
        private static const POOL:Array = [];

        protected var _type:String;
        protected var _window:IWindow;
        protected var _related:IWindow;
        protected var _cancelled:Boolean;
        protected var _cancelable:Boolean;
        protected var _recycled:Boolean;
        protected var _pool:Array;


        public static function allocate(type:String, window:IWindow, related:IWindow, cancelable:Boolean=false):WindowEvent
        {
            var _local_5:WindowEvent = ((POOL.length > 0) ? POOL.pop() : new (WindowEvent)());
            _local_5._type = type;
            _local_5._window = window;
            _local_5._related = related;
            _local_5._cancelable = cancelable;
            _local_5._recycled = false;
            _local_5._pool = POOL;
            return _local_5;
        }


        public function get type():String
        {
            return this._type;
        }

        public function get target():IWindow
        {
            return this._window;
        }

        public function get window():IWindow
        {
            return this._window;
        }

        public function get related():IWindow
        {
            return this._related;
        }

        public function get cancelable():Boolean
        {
            return this._cancelable;
        }

        public function recycle():void
        {
            if (this._recycled)
            {
                throw (new Error("Event already recycled!"));
            }
            this._window = (this._related = null);
            this._recycled = true;
            this._cancelled = false;
            this._pool.push(this);
        }

        public function clone():WindowEvent
        {
            return allocate(this._type, this._window, this.related, this.cancelable);
        }

        public function preventDefault():void
        {
            this.preventWindowOperation();
        }

        public function isDefaultPrevented():Boolean
        {
            return this._cancelled;
        }

        public function preventWindowOperation():void
        {
            if (this.cancelable)
            {
                this._cancelled = true;
            }
            else
            {
                throw (new Error("Attempted to prevent window operation that is not cancelable!"));
            }
        }

        public function isWindowOperationPrevented():Boolean
        {
            return this._cancelled;
        }

        public function stopPropagation():void
        {
            this._cancelled = true;
        }

        public function stopImmediatePropagation():void
        {
            this._cancelled = true;
        }

        public function toString():String
        {
            return ((((("WindowEvent { type: " + this._type) + " cancelable: ") + this._cancelable) + " window: ") + this._window) + " }";
        }
    }
}
