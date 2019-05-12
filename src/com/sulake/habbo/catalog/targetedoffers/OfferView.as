package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.targetedoffers.util.RemainingTimeFormatter;
    import com.sulake.core.window.components.ITextWindow;

    public class OfferView implements IDisposable 
    {
        protected var _window:IWindowContainer;
        protected var _Str_2278:OfferController;
        protected var _Str_2324:TargetedOffer;
        protected var _Str_2788:Timer;
        protected var _disposed:Boolean;
        protected var _Str_5181:String;

        public function OfferView(k:OfferController, _arg_2:TargetedOffer)
        {
            this._Str_2278 = k;
            this._Str_2324 = _arg_2;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._Str_2788 != null)
            {
                this._Str_2788.stop();
                this._Str_2788 = null;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        protected function _Str_13550():void
        {
            this._Str_2788 = new Timer(1000);
            this._Str_2788.addEventListener(TimerEvent.TIMER, this._Str_11704);
            this._Str_2788.start();
            this._Str_20163();
        }

        protected function _Str_11704(k:TimerEvent):void
        {
            this._Str_20163();
        }

        protected function _Str_20163():void
        {
            this.setTimeLeft(RemainingTimeFormatter._Str_25649(this._Str_2278.catalog.localization, this._Str_2324._Str_18165()));
            if (this._Str_2324._Str_18165() == 0)
            {
                this._Str_2278._Str_6602();
            }
        }

        protected function setTimeLeft(k:String):void
        {
            var _local_2:ITextWindow = ITextWindow(this._window.findChildByName("txt_time_left"));
            if (!_local_2)
            {
                return;
            }
            _local_2.text = ((this._Str_5181 != "") ? this._Str_5181.replace("%timeleft%", k) : k);
        }

        protected function getLocalization(k:String, _arg_2:String=null):String
        {
            var _local_3:String = this._Str_2278.catalog.localization.getLocalization(k, ((_arg_2) || (k)));
            if (!_local_3)
            {
                return null;
            }
            if (this._Str_2324)
            {
                _local_3 = _local_3.replace("%itemsleft%", this._Str_2324.purchaseLimit);
            }
            return _local_3;
        }
    }
}
