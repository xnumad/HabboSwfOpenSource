package com.sulake.core.window.motion
{
    public class Callback extends Motion 
    {
        protected var _callback:Function;

        public function Callback(k:Function)
        {
            super(null);
            this._callback = k;
        }

        override public function get running():Boolean
        {
            return (_running) && (!(this._callback == null));
        }

        override public function tick(k:int):void
        {
			super.tick(k);
            if (this._callback != null)
            {
                this._callback(this);
                this._callback = null;
            }
        }
    }
}
