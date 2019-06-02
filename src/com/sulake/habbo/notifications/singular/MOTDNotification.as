package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
	import com.sulake.habbo.notifications.HabboNotifications;

    public class MOTDNotification implements IDisposable 
    {
        private var _habboNotifications:HabboNotifications;
        private var _Str_2440:_Str_2784;
        private var _type:String;
        private var _Str_4071:Map;

        public function MOTDNotification(k:HabboNotifications, _arg_2:String, _arg_3:Map)
        {
            var _local_11:IWindow;
            var _local_12:IWindow;
            super();
            this._habboNotifications = k;
            this._type = _arg_2;
            this._Str_4071 = _arg_3;
            var _local_4:String = this._Str_5512("title", true);
            var _local_5:String = this._Str_5512("message", true).replace(/\\r/g, "\r");
            var _local_6:String = this._Str_5512("linkUrl", false);
            var _local_7:String;
            var _local_8:Boolean = ((!(_local_6 == null)) && (_local_6.substr(0, 6) == "event:"));
            if (_local_6 != null)
            {
                _local_7 = this._Str_5512("linkTitle", false);
                if (_local_7 == null)
                {
                    _local_7 = _local_6;
                }
            }
            var _local_9:IAsset = this._habboNotifications.assets.getAssetByName("layout_notification_popup_xml");
            this._Str_2440 = this._habboNotifications.windowManager.buildModalDialogFromXML((_local_9.content as XML));
            var _local_10:IWindowContainer = (this._Str_2440._Str_2429 as IWindowContainer);
            _local_10.procedure = this._Str_2533;
            _local_10.caption = _local_4;
            if (_local_6 != null)
            {
                if (_local_8)
                {
                    _local_11 = _local_10.findChildByName("action");
                    _local_11.visible = true;
                    _local_11.caption = _local_7;
                }
                else
                {
                    _local_12 = _local_10.findChildByName("link");
                    _local_12.visible = true;
                    _local_12.caption = _local_7;
                }
            }
            _local_10.findChildByName("message").caption = _local_5;
            IStaticBitmapWrapperWindow(_local_10.findChildByName("illustration")).assetUri = this._habboNotifications._Str_20214(_arg_3, _arg_2);
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._Str_2440.dispose();
            this._Str_2440 = null;
            this._habboNotifications = null;
            this._type = null;
            this._Str_4071 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_2440 == null;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (this.disposed)
            {
                return;
            }
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            this.dispose();
                            break;
                        case "action":
                            this._habboNotifications.createLinkEvent(this._Str_5512("linkUrl", false).substr(6));
                            this.dispose();
                            break;
                        case "link":
                            HabboWebTools.openWebPage(this._Str_5512("linkUrl", false), "habboMain");
                            break;
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    if (_arg_2.name == "illustration")
                    {
                        _arg_2.parent.limits.minHeight = _arg_2.height;
                    }
                    return;
            }
        }

        private function _Str_5512(k:String, _arg_2:Boolean):String
        {
            return this._habboNotifications._Str_5512(this._Str_4071, this._type, k, _arg_2);
        }
    }
}
