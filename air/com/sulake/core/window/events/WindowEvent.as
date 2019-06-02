//com.sulake.core.window.events.WindowEvent

package com.sulake.core.window.events{
    import com.sulake.core.window.IWindow;

    public class WindowEvent {

        public static const WINDOW_EVENT_DESTROY:String;
        public static const WINDOW_EVENT_DESTROYED:String;
        public static const WINDOW_EVENT_OPEN:String;
        public static const WINDOW_EVENT_OPENED:String;
        public static const WINDOW_EVENT_CLOSE:String;
        public static const WINDOW_EVENT_CLOSED:String;
        public static const WINDOW_EVENT_FOCUS:String;
        public static const WINDOW_EVENT_FOCUSED:String;
        public static const WINDOW_EVENT_UNFOCUS:String;
        public static const WINDOW_EVENT_UNFOCUSED:String;
        public static const WINDOW_EVENT_ACTIVATE:String;
        public static const WINDOW_EVENT_ACTIVATED:String;
        public static const WINDOW_EVENT_DEACTIVATE:String;
        public static const WINDOW_EVENT_DEACTIVATED:String;
        public static const WINDOW_EVENT_SELECT:String;
        public static const WINDOW_EVENT_SELECTED:String;
        public static const WINDOW_EVENT_UNSELECT:String;
        public static const WINDOW_EVENT_UNSELECTED:String;
        public static const WINDOW_EVENT_LOCK:String;
        public static const WINDOW_EVENT_LOCKED:String;
        public static const WINDOW_EVENT_UNLOCK:String;
        public static const WINDOW_EVENT_UNLOCKED:String;
        public static const WINDOW_EVENT_ENABLE:String;
        public static const WINDOW_EVENT_ENABLED:String;
        public static const WINDOW_EVENT_DISABLE:String;
        public static const WINDOW_EVENT_DISABLED:String;
        public static const WINDOW_EVENT_RELOCATE:String;
        public static const WINDOW_EVENT_RELOCATED:String;
        public static const WINDOW_EVENT_RESIZE:String;
        public static const WINDOW_EVENT_RESIZED:String;
        public static const WINDOW_EVENT_MINIMIZE:String;
        public static const WINDOW_EVENT_MINIMIZED:String;
        public static const WINDOW_EVENT_MAXIMIZE:String;
        public static const WINDOW_EVENT_MAXIMIZED:String;
        public static const WINDOW_EVENT_RESTORE:String;
        public static const WINDOW_EVENT_RESTORED:String;
        public static const WINDOW_EVENT_CHILD_ADDED:String;
        public static const WINDOW_EVENT_CHILD_REMOVED:String;
        public static const WINDOW_EVENT_CHILD_RELOCATED:String;
        public static const WINDOW_EVENT_CHILD_RESIZED:String;
        public static const WINDOW_EVENT_CHILD_ACTIVATED:String;
        public static const WINDOW_EVENT_CHILD_VISIBILITY:String;
        public static const WINDOW_EVENT_PARENT_ADDED:String;
        public static const WINDOW_EVENT_PARENT_REMOVED:String;
        public static const WINDOW_EVENT_PARENT_RELOCATED:String;
        public static const WINDOW_EVENT_PARENT_RESIZED:String;
        public static const WINDOW_EVENT_PARENT_ACTIVATED:String;
        public static const WINDOW_EVENT_OK:String;
        public static const WINDOW_EVENT_CANCEL:String;
        public static const WINDOW_EVENT_CHANGE:String;
        public static const WINDOW_EVENT_SCROLL:String;
        public static const UNKNOWN:String;
        private static const POOL:Array;

        protected var _type:String;
        protected var _window:IWindow;
        protected var _related:IWindow;
        protected var _cancelled:Boolean;
        protected var _cancelable:Boolean;
        protected var _recycled:Boolean;
        protected var _pool:Array;

        public function WindowEvent();

        public static function allocate(k:String, _arg_2:IWindow, _arg_3:IWindow, _arg_4:Boolean=false):WindowEvent;


        public function get type():String;

        public function get target():IWindow;

        public function get window():IWindow;

        public function get related():IWindow;

        public function get cancelable():Boolean;

        public function recycle():void;

        public function clone():WindowEvent;

        public function preventDefault():void;

        public function isDefaultPrevented():Boolean;

        public function preventWindowOperation():void;

        public function isWindowOperationPrevented():Boolean;

        public function stopPropagation():void;

        public function stopImmediatePropagation():void;

        public function toString():String;


    }
}//package com.sulake.core.window.events

