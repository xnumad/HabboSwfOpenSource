package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_4633;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_7856;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;

    public class UserListCtrl implements IDisposable 
    {
        private static const _Str_17518:int = 200;

        protected var _Str_2272:IHabboTransitionalNavigator;
        private var _Str_16557:Boolean;
        protected var _Str_3114:int;

        public function UserListCtrl(k:IHabboTransitionalNavigator, _arg_2:Boolean)
        {
            this._Str_2272 = k;
            this._Str_16557 = _arg_2;
        }

        public function dispose():void
        {
            this._Str_2272 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_2272 == null;
        }

        public function refresh(k:IItemListWindow, _arg_2:Array, _arg_3:String, _arg_4:int):void
        {
            var _local_6:_Str_4633;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_5:Array = new Array();
            for each (_local_6 in _arg_2)
            {
                if (((_arg_3 == "") || (_local_6.userName.toLowerCase().indexOf(_arg_3) > -1)))
                {
                    _local_5.push(_local_6);
                }
                if (_local_5.length >= _Str_17518)
                {
                    break;
                }
            }
            k.autoArrangeItems = false;
            _local_7 = 0;
            while (true)
            {
                _local_8 = this._Str_2966(k, _local_7, _local_5[_local_7], _arg_4);
                if (_local_8)
                {
                    break;
                }
                _local_7++;
            }
            k.autoArrangeItems = true;
            k.invalidate();
            this._Str_3114 = _local_5.length;
        }

        private function getListEntry(k:int):IWindowContainer
        {
            var _local_2:IWindowContainer = this.getRowView();
            var _local_3:IRegionWindow = IRegionWindow(_local_2.findChildByName("bg_region"));
            _local_3.addEventListener(WindowMouseEvent.CLICK, this.onBgMouseClick);
            _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_18088);
            _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_17027);
            _Str_3521.setup(_local_2, this._Str_25336);
            _local_2.id = k;
            return _local_2;
        }

        protected function getRowView():IWindowContainer
        {
            return IWindowContainer(this._Str_2272.getXmlWindow(((this._Str_16557) ? "ros_friend" : "ros_flat_controller")));
        }

        protected function getBgColor(k:int, _arg_2:Boolean):uint
        {
            return (_arg_2) ? 4290173439 : (((k % 2) != 0) ? 0xFFFFFFFF : 4293519841);
        }

        private function _Str_2966(k:IItemListWindow, _arg_2:int, _arg_3:_Str_4633, _arg_4:int):Boolean
        {
            var _local_5:IWindowContainer = IWindowContainer(k.getListItemAt(_arg_2));
            if (_local_5 == null)
            {
                if (_arg_3 == null)
                {
                    return true;
                }
                _local_5 = this.getListEntry(_arg_2);
                k.addListItem(_local_5);
            }
            if (_arg_3 != null)
            {
                _local_5.color = this.getBgColor(_arg_2, (_arg_3.userId == _arg_4));
                this.refreshEntryDetails(_local_5, _arg_3);
                _local_5.visible = true;
                _local_5.height = 20;
            }
            else
            {
                _local_5.height = 0;
                _local_5.visible = false;
            }
            return false;
        }

        private function refreshEntryDetails(k:IWindowContainer, _arg_2:_Str_4633):void
        {
            k.findChildByName("user_name_txt").caption = _arg_2.userName;
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName("bg_region"));
            _local_3.id = _arg_2.userId;
            k.findChildByName("user_info_region").id = _arg_2.userId;
            _Str_3521._Str_3927(false, k);
        }

        protected function onBgMouseClick(k:WindowEvent):void
        {
            var _local_3:Array;
            var _local_2:IWindowContainer = IWindowContainer(k.target);
            if (this._Str_16557)
            {
                this._Str_2272.send(new _Str_7856(_local_2.id));
            }
            else
            {
                _local_3 = new Array();
                _local_3.push(_local_2.id);
                this._Str_2272.send(new RemoveRightsMessageComposer(_local_3));
            }
        }

        private function _Str_18088(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = IWindowContainer(k.target.parent);
            _local_2.color = this.getBgColor(-1, true);
            var _local_3:IWindow = _local_2.findChildByName("arrow_icon");
            if (_local_3 != null)
            {
                _local_3.visible = true;
            }
        }

        private function _Str_17027(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = IWindowContainer(k.target.parent);
            _local_2.color = this.getBgColor(_local_2.id, false);
            var _local_3:IWindow = _local_2.findChildByName("arrow_icon");
            if (_local_3 != null)
            {
                _local_3.visible = false;
            }
        }

        public function get userCount():int
        {
            return this._Str_3114;
        }

        private function _Str_25336(k:WindowEvent):void
        {
            this._Str_2272.trackGoogle("extendedProfile", "navigator_roomSettingsUsersList");
            this._Str_2272.send(new _Str_2553(k.target.id));
        }
    }
}
