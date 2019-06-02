//com.sulake.core.window.events.WindowKeyboardEvent

package com.sulake.core.window.events{
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import com.sulake.core.window.IWindow;

    public class WindowKeyboardEvent extends WindowEvent {

        public static const WINDOW_EVENT_KEY_UP:String;
        public static const WINDOW_EVENT_KEY_DOWN:String;
        private static const POOL:Array;

        private var _event:KeyboardEvent;

        public function WindowKeyboardEvent();

        public static function allocate(k:String, _arg_2:Event, _arg_3:IWindow, _arg_4:IWindow, _arg_5:Boolean=false):WindowKeyboardEvent;


        public function get charCode():uint;

        public function get keyCode():uint;

        public function get keyLocation():uint;

        public function get altKey():Boolean;

        public function get shiftKey():Boolean;

        public function get ctrlKey():Boolean;

        override public function clone():WindowEvent;

        override public function toString():String;


    }
}//package com.sulake.core.window.events

