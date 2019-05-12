package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.model.NonLinearVideoAd;

    public class _Str_4535 extends Event 
    {
        protected var _Str_17935:NonLinearVideoAd = null;

        public function _Str_4535(k:String, _arg_2:NonLinearVideoAd, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._Str_17935 = _arg_2;
        }

        public function _Str_19052():Boolean
        {
            return !(this.nonLinearVideoAd == null);
        }

        public function set nonLinearVideoAd(k:NonLinearVideoAd):void
        {
            this._Str_17935 = this.nonLinearVideoAd;
        }

        public function get nonLinearVideoAd():NonLinearVideoAd
        {
            return this._Str_17935;
        }

        public function _Str_21016():Boolean
        {
            if (this._Str_19052())
            {
                return this.nonLinearVideoAd.isInteractive();
            }
            return false;
        }
    }
}
