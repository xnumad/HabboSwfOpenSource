package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class MallOfferDialogView 
    {
        private var _controller:OfferController;
        private var _window:IWindowContainer;
        private var _offer:HabboMallOffer;

        public function MallOfferDialogView(k:OfferController, _arg_2:HabboMallOffer)
        {
            var _local_3:String;
            super();
            this._controller = k;
            this._offer = _arg_2;
            this._window = IWindowContainer(this._controller.catalog.windowManager.buildFromXML(XML(this._controller.catalog.assets.getAssetByName("targeted_offer_habbomall_xml").content)));
            IFrameWindow(this._window).title.text = this.getLocalization(this._offer.title);
            ITextWindow(this._window.findChildByName("txt_title")).text = this.getLocalization(this._offer.title);
            if (((_arg_2.imageUrl) && (_arg_2.imageUrl.length > 0)))
            {
                _local_3 = (this._controller.catalog as IHabboConfigurationManager).getProperty("image.library.url");
                IStaticBitmapWrapperWindow(this._window.findChildByName("bmp_illustration")).assetUri = (_local_3 + _arg_2.imageUrl);
            }
            this._window.procedure = this._Str_3055;
            this._window.center();
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(this._controller)) || (!(this._offer))))
            {
                return;
            }
            if (k.type == WindowMouseEvent.DOWN)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        this._controller._Str_25187(this._offer);
                        return;
                    case "btn_buy":
                        this._controller._Str_23977(this._offer);
                        return;
                }
            }
        }

        private function getLocalization(k:String, _arg_2:String=null):String
        {
            return this._controller.catalog.localization.getLocalization(k, ((_arg_2) || (k)));
        }
    }
}
