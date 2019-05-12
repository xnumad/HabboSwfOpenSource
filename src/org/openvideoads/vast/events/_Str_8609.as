package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.schedule.Stream;

    public class _Str_8609 extends Event 
    {
        public static const _Str_7412:String = "schedule-stream";
        public static const _Str_19519:String = "remove-stream";

        protected var _Str_1430:Stream = null;
        protected var _Str_16686:int = -1;

        public function _Str_8609(k:String, _arg_2:int, _arg_3:Stream, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._Str_16686 = _arg_2;
            this._Str_1430 = _arg_3;
        }

        public function set _Str_22367(k:int):void
        {
            this._Str_16686 = k;
        }

        public function get _Str_22367():int
        {
            return this._Str_16686;
        }

        public function set stream(k:Stream):void
        {
            this._Str_1430 = k;
        }

        public function get stream():Stream
        {
            return this._Str_1430;
        }
    }
}
