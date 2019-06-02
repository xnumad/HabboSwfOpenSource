package com.sulake.habbo.window.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.utils.HabboWebTools;

    public class _Str_10133 implements IDisposable 
    {
        private static const _Str_4658:int = 10;

        private var _disposed:Boolean;
        private var _Str_2440:_Str_2784;
        private var _Str_577:String;
        private var _window:IWindowContainer;
        private var _Str_1929:IItemListWindow;
        private var _Str_7458:IItemListWindow;
        private var _Str_13821:IItemListWindow;
        private var _Str_18789:IWindow;
        private var _Str_10246:IWindow;
        private var _Str_1676:ITextLinkWindow;
        private var _Str_5447:IStaticBitmapWrapperWindow;
        private var _Str_13273:Function;
        private var _Str_15643:Function;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;

        public function _Str_10133(k:HabboWindowManagerComponent, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:Map, _arg_8:String, _arg_9:Function, _arg_10:Function)
        {
            var _local_12:String;
            var _local_13:String;
            var _local_14:String;
            super();
            this._Str_13273 = _arg_9;
            this._Str_15643 = _arg_10;
            this._habboWindowManagerComponent = k;
            var _local_11:IAsset = k.assets.getAssetByName("simple_alert_xml");
            this._Str_2440 = k.buildModalDialogFromXML((_local_11.content as XML));
            this._window = IWindowContainer(this._Str_2440._Str_2429);
            this._Str_1929 = IItemListWindow(this._window.findChildByName("list"));
            this._Str_7458 = IItemListWindow(this._window.findChildByName("list_top"));
            this._Str_13821 = IItemListWindow(this._window.findChildByName("list_bottom"));
            this._Str_18789 = this._window.findChildByName("message");
            this._Str_10246 = this._window.findChildByName("subtitle");
            this._Str_1676 = ITextLinkWindow(this._window.findChildByName("link"));
            this._Str_5447 = IStaticBitmapWrapperWindow(this._window.findChildByName("illustration"));
            this._window.findChildByName("header_button_close").dispose();
            this._window.procedure = this._Str_2533;
            this._window.caption = _arg_2;
            this._Str_18789.caption = _arg_4;
            if (_arg_7 != null)
            {
                for each (_local_12 in [_arg_2, _arg_3, _arg_4, _arg_5])
                {
                    if ((((!(_local_12 == null)) && (_local_12.substr(0, 2) == "${")) && (_local_12.indexOf("}") > 0)))
                    {
                        _local_13 = _local_12.substring(2, _local_12.indexOf("}"));
                        for (_local_14 in _arg_7)
                        {
                            k.localization.registerParameter(_local_13, _local_14, _arg_7.getValue(_local_14));
                        }
                    }
                }
            }
            if (((!(_arg_3 == null)) && (!(_arg_3 == ""))))
            {
                this._Str_10246.caption = _arg_3;
            }
            else
            {
                this._Str_10246.dispose();
                this._Str_10246 = null;
            }
            _arg_6 = k.interpolate(_arg_6);
            if ((((!(_arg_5 == null)) && (!(_arg_5 == ""))) && (((!(_arg_6 == null)) && (!(_arg_6 == ""))) || (!(_arg_9 == null)))))
            {
                this._Str_1676.caption = _arg_5;
                this._Str_1676.addEventListener(WindowMouseEvent.CLICK, this._Str_19927);
                this._Str_1676.immediateClickMode = true;
                this._Str_577 = _arg_6;
            }
            else
            {
                this._Str_1676.dispose();
                this._Str_1676 = null;
            }
            if (((!(_arg_8 == null)) && (!(_arg_8 == ""))))
            {
                this._Str_5447.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_19872);
                this._Str_5447.assetUri = _arg_8;
            }
            else
            {
                this._Str_5447.dispose();
                this._Str_5447 = null;
            }
            this._Str_5127();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.close();
                this._habboWindowManagerComponent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function close():void
        {
            if (this._Str_15643 != null)
            {
                this._Str_15643();
            }
            if (this._Str_2440 != null)
            {
                if (this._Str_1676 != null)
                {
                    this._Str_1676.removeEventListener(WindowMouseEvent.CLICK, this._Str_19927);
                    this._Str_1676 = null;
                }
                if (this._Str_5447)
                {
                    this._Str_5447.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_19872);
                    this._Str_5447 = null;
                }
                this._window = null;
                this._Str_1929 = null;
                this._Str_7458 = null;
                this._Str_13821 = null;
                this._Str_18789 = null;
                this._Str_10246 = null;
                this._Str_13273 = null;
                this._Str_15643 = null;
                this._Str_2440.dispose();
                this._Str_2440 = null;
            }
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (_arg_2.name == "close_button")))
            {
                this.dispose();
            }
        }

        private function _Str_19927(k:WindowMouseEvent):void
        {
            if (((!(this._Str_577 == null)) && (this._Str_577.length > 0)))
            {
                if (this._Str_577.substr(0, 6) == "event:")
                {
                    this._habboWindowManagerComponent.context.createLinkEvent(this._Str_577.substr(6));
                    this.dispose();
                }
                else
                {
                    HabboWebTools.openWebPage(this._Str_577, "habboMain");
                }
            }
            else
            {
                if (this._Str_13273 != null)
                {
                    this._Str_13273();
                    this.dispose();
                }
            }
        }

        private function _Str_19872(k:WindowEvent):void
        {
            this._Str_7458.x = (this._Str_5447.width + _Str_4658);
            this._Str_13821.width = this._Str_7458.right;
            this._window.width = (this._Str_7458.right + (2 * _Str_4658));
            this._Str_7458.limits.minHeight = (this._Str_5447.height + _Str_4658);
            this._Str_5127();
        }

        private function _Str_5127():void
        {
            this._Str_7458.arrangeListItems();
            this._Str_13821.arrangeListItems();
            this._Str_1929.arrangeListItems();
            this._window.height = (this._Str_1929.height + 40);
            this._window.center();
        }
    }
}
