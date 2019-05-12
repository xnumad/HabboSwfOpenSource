package org.openvideoads.util
{
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.utils.ByteArray;

    public class _Str_9615 extends TransformingLoader 
    {
        protected var _Str_17656:Timer = null;


        override public function load(k:URLRequest):void
        {
        }

        public function process(k:String):void
        {
            this.data = k;
            this._Str_17656 = new Timer(300, 1);
            this._Str_17656.addEventListener(TimerEvent.TIMER, this._Str_22988);
            this._Str_17656.start();
        }

        private function _Str_22988(k:TimerEvent):void
        {
            this.dispatchEvent(new Event(Event.COMPLETE));
        }

        public function _Str_25957():uint
        {
            var k:ByteArray;
            if (this.data != null)
            {
                k = new ByteArray();
                k.writeUTFBytes(this.data);
                return k.length;
            }
            return 0;
        }
    }
}
