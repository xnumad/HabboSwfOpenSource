package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class MallOfferMinimizedView extends OfferView 
    {
        private static const _Str_5155:String = "targetedoffers/offer_default_icon.png";

        private var _mallOffer:HabboMallOffer;

        public function MallOfferMinimizedView(k:OfferController, _arg_2:HabboMallOffer)
        {
            super(k, null);
            this._mallOffer = _arg_2;
            _window = IWindowContainer(_controller.catalog.windowManager.buildFromXML(XML(_controller.catalog.assets.getAssetByName("targeted_offer_minimized_xml").content)));
            var _local_3:ITextWindow = ITextWindow(_window.findChildByName("txt_title"));
            if (_local_3)
            {
                _local_3.text = getLocalization(_arg_2.title);
            }
            var _local_4:String = (_controller.catalog as IHabboConfigurationManager).getProperty("image.library.url");
            IStaticBitmapWrapperWindow(_window.findChildByName("bmp_icon")).assetUri = (_local_4 + _Str_5155);
            _window.procedure = this.onInput;
            _controller.attachExtension(_window);
        }

        private function onInput(k:WindowEvent, _arg_2:IWindow):void
        {
            if (!_controller)
            {
                return;
            }
            if (k.type == WindowMouseEvent.DOWN)
            {
                _controller.maximizeMallOffer(this._mallOffer);
                switch (_arg_2.name)
                {
                }
            }
        }

        public function get window():IWindow
        {
            return _window;
        }
    }
}
