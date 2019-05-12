package org.openvideoads.base
{
    import flash.events.EventDispatcher;
    import flash.events.Event;

    public class _Str_4989 extends Debuggable 
    {
        protected var _eventDispatcher:EventDispatcher;

        public function _Str_4989()
        {
            this._eventDispatcher = new EventDispatcher();
            super();
        }

        public function dispatchEvent(k:Event):void
        {
            this._eventDispatcher.dispatchEvent(k);
        }

        public function addEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            this._eventDispatcher.addEventListener(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function removeEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            this._eventDispatcher.removeEventListener(k, _arg_2, _arg_3);
        }
    }
}
