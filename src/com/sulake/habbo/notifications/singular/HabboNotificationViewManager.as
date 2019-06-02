package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.assets.IAssetLibrary;
	import com.sulake.habbo.notifications.singular.HabboNotificationItem;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.notifications.HabboNotifications;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.toolbar.events.ExtensionViewEvent;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import flash.events.Event;

    public class HabboNotificationViewManager implements IUpdateReceiver 
    {
        private static const _Str_2942:int = 4;

        private var _assetLibrary:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _toolbar:IHabboToolbar;
        private var _notifications:HabboNotifications;
        private var _styleConfig:Map;
        private var _viewConfig:Map;
        private var _disposed:Boolean = false;
        private var _viewItems:Array;

        public function HabboNotificationViewManager(k:HabboNotifications, _arg_2:IAssetLibrary, _arg_3:IHabboWindowManager, _arg_4:IHabboToolbar, _arg_5:Map, _arg_6:Map)
        {
            this._notifications = k;
            this._assetLibrary = _arg_2;
            this._windowManager = _arg_3;
            this._toolbar = _arg_4;
            this._styleConfig = _arg_5;
            this._viewConfig = _arg_6;
            this._viewItems = new Array();
            if (this._toolbar)
            {
                this._toolbar.events.addEventListener(ExtensionViewEvent.EVE_EXTENSION_VIEW_RESIZED, this._Str_22079);
            }
            this._notifications.registerUpdateReceiver(this, 2);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_18673(k:BadgeImageReadyEvent):void
        {
            var _local_2:HabboNotificationItemView;
            for each (_local_2 in this._viewItems)
            {
                _local_2._Str_18673(k);
            }
        }

        public function dispose():void
        {
            var k:int = this._viewItems.length;
            var _local_2:int;
            while (_local_2 < k)
            {
                (this._viewItems.pop() as HabboNotificationItemView).dispose();
                _local_2++;
            }
            this._assetLibrary = null;
            this._windowManager = null;
            if (this._styleConfig)
            {
                this._styleConfig.dispose();
                this._styleConfig = null;
            }
            if (this._viewConfig)
            {
                this._viewConfig.dispose();
                this._viewConfig = null;
            }
            if (this._toolbar)
            {
                this._toolbar.events.removeEventListener(ExtensionViewEvent.EVE_EXTENSION_VIEW_RESIZED, this._Str_22079);
                this._toolbar = null;
            }
            if (this._notifications != null)
            {
                this._notifications.removeUpdateReceiver(this);
                this._notifications = null;
            }
            this._disposed = true;
        }

        public function _Str_16969(k:HabboNotificationItem):Boolean
        {
            if (!this._Str_19647())
            {
                return false;
            }
            var _local_2:HabboNotificationItemView = new HabboNotificationItemView(this._assetLibrary.getAssetByName("layout_notification_xml"), this._windowManager, this._styleConfig, this._viewConfig, k);
            _local_2._Str_5615(this._Str_22218());
            this._viewItems.push(_local_2);
            this._viewItems.sortOn("verticalPosition", Array.NUMERIC);
            return true;
        }

        public function _Str_19647():Boolean
        {
            return (this._Str_22218() + HabboNotificationItemView._Str_9659) < this._windowManager.getDesktop(0).height;
        }

        public function update(k:uint):void
        {
            var _local_3:HabboNotificationItemView;
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < this._viewItems.length)
            {
                (this._viewItems[_local_2] as HabboNotificationItemView).update(k);
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < this._viewItems.length)
            {
                _local_3 = (this._viewItems[_local_2] as HabboNotificationItemView);
                if (_local_3.ready)
                {
                    _local_3.dispose();
                    this._viewItems.splice(_local_2, 1);
                    _local_2--;
                }
                _local_2++;
            }
        }

        private function _Str_22218():int
        {
            var _local_4:HabboNotificationItemView;
            if (!this._toolbar)
            {
                return _Str_2942;
            }
            if (!this._toolbar.extensionView)
            {
                return _Str_2942;
            }
            var k:int = (this._toolbar.extensionView.screenHeight + _Str_2942);
            if (this._viewItems.length == 0)
            {
                return k;
            }
            var _local_2:int = k;
            var _local_3:int;
            while (_local_3 < this._viewItems.length)
            {
                _local_4 = (this._viewItems[_local_3] as HabboNotificationItemView);
                if ((_local_2 + HabboNotificationItemView._Str_9659) < _local_4.verticalPosition)
                {
                    return _local_2;
                }
                _local_2 = ((_local_4.verticalPosition + HabboNotificationItemView._Str_9659) + _Str_2942);
                _local_3++;
            }
            return _local_2;
        }

        public function _Str_22079(k:Event):void
        {
            var _local_4:HabboNotificationItemView;
            var _local_2:int = (this._toolbar.extensionView.screenHeight + _Str_2942);
            var _local_3:int;
            while (_local_3 < this._viewItems.length)
            {
                _local_4 = (this._viewItems[_local_3] as HabboNotificationItemView);
                _local_4._Str_5615(_local_2);
                _local_2 = ((_local_4.verticalPosition + HabboNotificationItemView._Str_9659) + _Str_2942);
                _local_3++;
            }
        }
    }
}
