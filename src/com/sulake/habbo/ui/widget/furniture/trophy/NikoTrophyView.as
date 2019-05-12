package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils.HabboWebTools;

    public class NikoTrophyView implements ITrophyView 
    {
        private var _viewType:int;
        private var _widget:TrophyFurniWidget;
        private var _window:IWindowContainer;

        public function NikoTrophyView(k:TrophyFurniWidget, _arg_2:int)
        {
            this._widget = k;
            this._viewType = _arg_2;
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._widget = null;
        }

        public function _Str_3030():Boolean
        {
            var _local_3:IWindow;
            var _local_4:ITextWindow;
            var _local_5:ITextLinkWindow;
            var _local_6:ITextWindow;
            var _local_7:IStaticBitmapWrapperWindow;
            var _local_8:String;
            var k:IAsset = this._widget.assets.getAssetByName("niko_trophy");
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return false;
            }
            if (this._window == null)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            }
            this._window.center();
            _local_3 = this._window.findChildByName("header_button_close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_25125);
            }
            _local_4 = (this._window.findChildByName("html_textbox") as ITextWindow);
            if (_local_4 != null)
            {
                switch (this._viewType)
                {
                    case TrophyFurniWidget._Str_10142:
                        _local_4.text = this._widget.localizations.getLocalization("niko.trophy.description.gold");
                        break;
                    case TrophyFurniWidget._Str_12649:
                        _local_4.text = this._widget.localizations.getLocalization("niko.trophy.description.silver");
                        break;
                }
            }
            _local_5 = (this._window.findChildByName("store_link") as ITextLinkWindow);
            if (_local_5 != null)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_20001);
            }
            _local_6 = (this._window.findChildByName("date") as ITextWindow);
            if (_local_6 != null)
            {
                this._widget.localizations.registerParameter("trophy.niko.date", "date", this._widget.date);
                _local_6.text = this._widget.localizations.getLocalization("trophy.niko.date");
            }
            _local_7 = (this._window.findChildByName("preview_image") as IStaticBitmapWrapperWindow);
            if (_local_7 != null)
            {
                if (this._viewType == TrophyFurniWidget._Str_10142)
                {
                    _local_7.assetUri = "${image.library.url}niko/niko_trophy_gold.png";
                }
                else
                {
                    _local_7.assetUri = "${image.library.url}niko/niko_trophy_silver.png";
                }
            }
            _local_7 = (this._window.findChildByName("store_image") as IStaticBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_7.assetUri = (("${image.library.url}niko/" + this._widget.configuration.getProperty("niko.trophy.appstore.image")) + ".png");
            }
            var _local_9:IRegionWindow = (this._window.findChildByName("appstore_region") as IRegionWindow);
            if (_local_9)
            {
                _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_20001);
            }
            return true;
        }

        public function _Str_7493():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_20001(k:WindowMouseEvent):void
        {
            var _local_2:String = this._widget.configuration.getProperty("niko.appstore.link.url");
            HabboWebTools.openWebPage(_local_2, "habboMain");
        }

        private function _Str_25125(k:WindowMouseEvent):void
        {
            this._Str_7493();
        }
    }
}
