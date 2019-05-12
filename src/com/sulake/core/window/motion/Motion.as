package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class Motion 
    {
        protected var _target:IWindow;
        protected var _running:Boolean;
        protected var _complete:Boolean = true;
        protected var _tag:String;

        public function Motion(k:IWindow)
        {
            this._target = k;
        }

        public function get running():Boolean
        {
            return ((this._running) && (this._target)) && (!(this._target.disposed));
        }

        public function get complete():Boolean
        {
            return this._complete;
        }

        public function set target(k:IWindow):void
        {
            this._target = k;
        }

        public function get target():IWindow
        {
            return this._target;
        }

        public function set tag(k:String):void
        {
            this._tag = k;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function start():void
        {
            this._running = true;
        }

        public function update(k:Number):void
        {
        }

        public function stop():void
        {
            this._target = null;
            this._running = false;
        }

        public function tick(k:int):void
        {
        }
    }
}
