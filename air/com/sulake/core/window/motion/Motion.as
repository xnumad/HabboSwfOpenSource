//com.sulake.core.window.motion.Motion

package com.sulake.core.window.motion{
    import com.sulake.core.window.IWindow;

    public class Motion {

        protected var _target:IWindow;
        protected var _running:Boolean;
        protected var _complete:Boolean;
        protected var _tag:String;

        public function Motion(k:IWindow);

        public function get running():Boolean;

        public function get complete():Boolean;

        public function set target(k:IWindow):void;

        public function get target():IWindow;

        public function set tag(k:String):void;

        public function get tag():String;

        function start():void;

        function update(k:Number):void;

        function stop():void;

        function tick(k:int):void;


    }
}//package com.sulake.core.window.motion

