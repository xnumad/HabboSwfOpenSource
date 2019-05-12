package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IFrameWindow;

    public class ClubPromoAlertView extends AlertView 
    {
        private var _text:String;
        private var _promoText:String;

        public function ClubPromoAlertView(k:IHabboTransitionalNavigator, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            super(k, "nav_promo_alert", _arg_2);
            this._text = _arg_3;
            this._promoText = _arg_4;
        }

        override internal function setupAlertWindow(k:IFrameWindow):void
        {
            var _local_2:IWindowContainer = k.content;
            _local_2.findChildByName("body_text").caption = this._text;
            _local_2.findChildByName("promo_text").caption = this._promoText;
            var _local_3:IWindow = _local_2.findChildByName("ok");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_6167);
            }
            var _local_4:IWindow = _local_2.findChildByName("promo_container");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_24289);
            }
        }

        private function _Str_6167(k:WindowMouseEvent):void
        {
            dispose();
        }

        private function _Str_24289(k:WindowMouseEvent):void
        {
            navigator.openCatalogClubPage("ClubPromoAlertView");
            dispose();
        }
    }
}

