package com.sulake.habbo.navigator.view
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class LiftView implements IUpdateReceiver 
    {
        private static const _Str_17661:uint = 8000;

        private var _navigator:HabboNewNavigator;
        private var _borderWindow:IBorderWindow;
        private var _pagerItemList:IItemListWindow;
        private var _pagerIconTemplate:IRegionWindow;
        private var _selectedPage:int = -1;
        private var _lastCycleMs:uint;

        public function LiftView(k:HabboNewNavigator)
        {
            this._lastCycleMs = getTimer();
            super();
            this._navigator = k;
            this._navigator.registerUpdateReceiver(this, 1000);
        }

        public function dispose():void
        {
            this._navigator.removeUpdateReceiver(this);
            this._navigator = null;
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }

        public function set _Str_26399(k:IRegionWindow):void
        {
            this._pagerIconTemplate = k;
        }

        public function set _Str_25913(k:IBorderWindow):void
        {
            this._borderWindow = k;
            this._pagerItemList = IItemListWindow(this._borderWindow.findChildByName("pager_itemlist"));
            IRegionWindow(this._borderWindow.findChildByName("room_image_click_region")).procedure = this._Str_24573;
        }

        public function refresh(k:Boolean=true):void
        {
            this._pagerItemList.destroyListItems();
            this._selectedPage = ((k) ? 0 : this._selectedPage);
            var _local_2:int;
            while (_local_2 < this._navigator._Str_7977._Str_6772.length)
            {
                this._pagerItemList.addListItem(this._pagerIconTemplate.clone());
                _local_2++;
            }
            this._Str_21803();
            this._Str_21713();
        }

        private function _Str_21803():void
        {
            var _local_2:IRegionWindow;
            var k:int;
            while (k < this._pagerItemList.numListItems)
            {
                _local_2 = IRegionWindow(this._pagerItemList.getListItemAt(k));
                IStaticBitmapWrapperWindow(_local_2.findChildByName("icon")).assetUri = ((k == this._selectedPage) ? "progress_disk_flat_on" : "progress_disk_flat_off");
                _local_2.id = k;
                _local_2.procedure = this._Str_23941;
                k++;
            }
        }

        private function _Str_21713():void
        {
            this._Str_21803();
            IStaticBitmapWrapperWindow(this._borderWindow.findChildByName("room_image")).assetUri = this._navigator._Str_7977._Str_25136(this._selectedPage);
            if (this._selectedPage < this._navigator._Str_7977._Str_6772.length)
            {
                this._borderWindow.findChildByName("caption_text").caption = this._navigator._Str_7977._Str_6772[this._selectedPage].caption;
            }
        }

        private function _Str_23757():void
        {
            this._selectedPage++;
            if (this._selectedPage > (this._navigator._Str_7977._Str_6772.length - 1))
            {
                this._selectedPage = 0;
            }
            this.refresh(false);
        }

        public function update(k:uint):void
        {
            var _local_2:uint = getTimer();
            if ((this._lastCycleMs + _Str_17661) < _local_2)
            {
                this._Str_23757();
                this._lastCycleMs = _local_2;
            }
        }

        private function _Str_23941(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.id != this._selectedPage)
                {
                    this._selectedPage = _arg_2.id;
                    this._Str_21713();
                    this._lastCycleMs = getTimer();
                    this._navigator.trackEventLog("browse.promotion", "Promotion", "", this._selectedPage);
                }
            }
        }

        private function _Str_24573(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._navigator._Str_7977._Str_6772.length > this._selectedPage)
                {
                    this._navigator.goToRoom(this._navigator._Str_7977._Str_6772[this._selectedPage].flatId, "promotion");
                }
            }
        }
    }
}
