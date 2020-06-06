package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TargetedOfferMinimizedView extends OfferView 
    {
        private static const _Str_5155:String = "targetedoffers/offer_default_icon.png";

        public function TargetedOfferMinimizedView(k:OfferController, _arg_2:TargetedOffer)
        {
            var _local_6:IItemListWindow;
            super(k, _arg_2);
            _window = IWindowContainer(_controller.catalog.windowManager.buildFromXML(XML(_controller.catalog.assets.getAssetByName("targeted_offer_minimized_xml").content)));
            var _local_3:ITextWindow = ITextWindow(_window.findChildByName("txt_title"));
            if (_local_3)
            {
                _local_3.text = getLocalization(_arg_2.title);
            }
            var _local_4:String = (_controller.catalog as IHabboConfigurationManager).getProperty("image.library.url");
            var _local_5:String = (((_arg_2._Str_13452) && (_arg_2._Str_13452.length > 0)) ? _arg_2._Str_13452 : _Str_5155);
            IStaticBitmapWrapperWindow(_window.findChildByName("bmp_icon")).assetUri = (_local_4 + _local_5);
            _Str_5181 = getLocalization("targeted.offer.minimized.timeleft", "");
            if (_offer.expirationTime == 0)
            {
                _local_6 = (_window.findChildByName("itemlist") as IItemListWindow);
                if (_local_6)
                {
                    _local_6.removeListItem(_window.findChildByName("cnt_time_left"));
                }
            }
            else
            {
                _Str_13550();
            }
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
                _controller.maximizeOffer(_offer);
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
