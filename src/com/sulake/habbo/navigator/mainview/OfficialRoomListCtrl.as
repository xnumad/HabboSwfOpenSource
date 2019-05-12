package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2632;
    import com.sulake.core.window.components.*;
    import com.sulake.habbo.navigator.*;

    public class OfficialRoomListCtrl implements IViewCtrl 
    {
        private var _navigator:HabboNavigator;
        private var _content:IWindowContainer;
        private var _list:IItemListWindow;
        private var _promotedRoomsListCtrl:PromotedRoomsListCtrl;

        public function OfficialRoomListCtrl(k:HabboNavigator):void
        {
            this._navigator = k;
            this._promotedRoomsListCtrl = new PromotedRoomsListCtrl(this._navigator);
        }

        public function dispose():void
        {
            if (this._promotedRoomsListCtrl != null)
            {
                this._promotedRoomsListCtrl.dispose();
                this._promotedRoomsListCtrl = null;
            }
        }

        public function set content(k:IWindowContainer):void
        {
            this._content = k;
            this._list = ((this._content) ? IItemListWindow(this._content.findChildByName("item_list_official")) : null);
        }

        public function get content():IWindowContainer
        {
            return this._content;
        }

        public function refresh():void
        {
            var _local_3:Boolean;
            var _local_4:IWindowContainer;
            var _local_5:Boolean;
            var k:Array = this._Str_24906();
            this._list.autoArrangeItems = false;
            this._Str_25113();
            var _local_2:int;
            while (true)
            {
                _local_3 = (!((_local_2 % 2) == 0));
                _local_4 = IWindowContainer(this._list.getListItemAt((_local_2 + 1)));
                if (_local_2 < k.length)
                {
                    this._Str_2966(true, _local_3, _local_4, k[_local_2]);
                }
                else
                {
                    _local_5 = this._Str_2966(false, _local_3, _local_4, null);
                    if (_local_5)
                    {
                        break;
                    }
                }
                _local_2++;
            }
            this._list.autoArrangeItems = true;
        }

        private function _Str_24906():Array
        {
            var _local_4:_Str_2632;
            var k:Array = this._navigator.data._Str_5645.entries;
            var _local_2:Array = new Array();
            var _local_3:int;
            for each (_local_4 in k)
            {
                if (_local_4._Str_22186 > 0)
                {
                    if (_local_4._Str_22186 == _local_3)
                    {
                        _local_2.push(_local_4);
                    }
                }
                else
                {
                    _local_3 = ((_local_4.open) ? _local_4.index : 0);
                    _local_2.push(_local_4);
                }
            }
            return _local_2;
        }

        private function _Str_2966(k:Boolean, _arg_2:Boolean, _arg_3:IWindowContainer, _arg_4:_Str_2632):Boolean
        {
            if (_arg_3 == null)
            {
                if (!k)
                {
                    return true;
                }
                _arg_3 = this._navigator._Str_7596._Str_9034(_arg_2);
                this._list.addListItem(_arg_3);
            }
            this._navigator._Str_7596._Str_2966(_arg_3, k, _arg_4);
            return false;
        }

        private function _Str_25113():void
        {
            var k:IWindowContainer = IWindowContainer(this._list.getListItemAt(0));
            this._promotedRoomsListCtrl.refresh(k, this._navigator.data._Str_5482.entries);
        }
    }
}
