package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class SafetyLockedNotification 
    {
        private static const SAFETY_LOCKED_NOTIFICATION:String = "safety_locked_notification";
        private static const _Str_4086:uint = 0xFFFFFF;
        private static const _Str_4030:uint = 12247545;

        private var _window:IBorderWindow;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _linkText:ITextWindow;
        private var _userId:int;

        public function SafetyLockedNotification(k:int, _arg_2:IAssetLibrary, _arg_3:IHabboWindowManager, _arg_4:IHabboCatalog, _arg_5:IHabboToolbar)
        {
            if ((((!(_arg_2)) || (!(_arg_3))) || (!(_arg_4))))
            {
                return;
            }
            this._catalog = _arg_4;
            this._toolbar = _arg_5;
            this._userId = k;
            var _local_6:XmlAsset = (_arg_2.getAssetByName("safety_locked_notification_xml") as XmlAsset);
            if (_local_6 == null)
            {
                return;
            }
            this._window = (_arg_3.buildFromXML((_local_6.content as XML)) as IBorderWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.procedure = this.eventHandler;
            this._toolbar.extensionView.attachExtension(SAFETY_LOCKED_NOTIFICATION, this._window);
            this._linkText = (this._window.findChildByName("unlock_link") as ITextWindow);
            var _local_7:IRegionWindow = (this._window.findChildByName("unlock_link_region") as IRegionWindow);
            if (_local_7)
            {
                _local_7.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                _local_7.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
            }
        }

        public function get visible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function dispose():void
        {
            if (this._toolbar)
            {
                this._toolbar.extensionView.detachExtension(SAFETY_LOCKED_NOTIFICATION);
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._catalog = null;
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "unlock_link_region":
                case "unlock_link":
                    _local_3 = (this._toolbar as Component).getProperty("link.format.safetylock_unlock");
                    HabboWebTools.openWebPage(_local_3, "habboMain");
                    return;
            }
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            this._linkText.textColor = _Str_4030;
        }

        private function onMouseOut(k:WindowMouseEvent):void
        {
            this._linkText.textColor = _Str_4086;
        }
    }
}
