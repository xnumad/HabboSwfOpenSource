package org.openvideoads.vast.events
{
    import org.openvideoads.vast.model.CompanionAd;
    import flash.events.Event;

    public class _Str_3117 extends _Str_4535 
    {
        public static const _Str_3831:String = "display-companion";
        public static const _Str_2703:String = "hide-companion";

        protected var _Str_17463:String = null;
        protected var _content:String = null;

        public function _Str_3117(k:String, _arg_2:CompanionAd, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function get companionAd():CompanionAd
        {
            return this.nonLinearVideoAd as CompanionAd;
        }

        public function set _Str_4022(k:String):void
        {
            this._Str_17463 = k;
        }

        public function get _Str_4022():String
        {
            return this._Str_17463;
        }

        public function set content(k:String):void
        {
            this._content = k;
        }

        public function get content():String
        {
            return this._content;
        }

        public function _Str_20014():Boolean
        {
            return true;
        }

        public function _Str_22404():Boolean
        {
            return false;
        }

        override public function clone():Event
        {
            var k:_Str_3117 = new _Str_3117(type, (nonLinearVideoAd as CompanionAd), bubbles, cancelable);
            k._Str_4022 = this._Str_17463;
            k.content = this._content;
            return k;
        }
    }
}
