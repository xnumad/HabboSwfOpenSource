package org.openvideoads.vast.schedule.ads
{
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.VASTController;
    import org.openvideoads.vast.config.Config;

    public class _Str_11486 extends AdSlot 
    {
        protected var _Str_4544:String = null;
        protected var _Str_10823:String = "relative";

        public function _Str_11486(k:StreamSequence, _arg_2:AdSchedule, _arg_3:VASTController, _arg_4:int=0, _arg_5:int=0, _arg_6:String=null, _arg_7:String=null, _arg_8:String=null, _arg_9:Array=null, _arg_10:String=null, _arg_11:String="00:00:00", _arg_12:Object=null, _arg_13:Boolean=true, _arg_14:Array=null, _arg_15:Array=null, _arg_16:String=null, _arg_17:String=null, _arg_18:String=null)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_10, _arg_11, _arg_12, _arg_13, _arg_14, _arg_15, _arg_16);
            this._Str_4544 = _arg_18;
            if (this._Str_10823 != null)
            {
                this._Str_10823 = _arg_17;
            }
        }

        public function set html(k:String):void
        {
            this._Str_4544 = k;
        }

        public function get html():String
        {
            return this._Str_4544;
        }

        public function set startPoint(k:String):void
        {
            this._Str_10823 = k;
        }

        public function get startPoint():String
        {
            return this._Str_10823;
        }

        public function _Str_26169():Boolean
        {
            return this._Str_10823.toUpperCase() == "RELATIVE";
        }

        override public function hasVideoAd():Boolean
        {
            return false;
        }

        override public function isNonLinear():Boolean
        {
            return true;
        }

        protected function _Str_25994(k:Object=null, _arg_2:Config=null):void
        {
        }

        protected function _Str_26322(k:Object=null, _arg_2:Config=null):void
        {
        }
    }
}
