package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class ToolbarHoverCtrl extends UserListCtrl 
    {
        private var _Str_6933:int = -1;

        public function ToolbarHoverCtrl(k:IHabboTransitionalNavigator)
        {
            super(k, false);
        }

        override protected function getRowView():IWindowContainer
        {
            return IWindowContainer(_Str_2272.getXmlWindow("ros_banned_user"));
        }

        override protected function onBgMouseClick(k:WindowEvent):void
        {
            this._Str_6933 = k.target.parent.id;
            this._Str_17449((k.target.findParentByName("moderation_banned_users") as IItemListWindow));
        }

        override protected function getBgColor(k:int, _arg_2:Boolean):uint
        {
            if (k == this._Str_6933)
            {
                return 4288329945;
            }
            return super.getBgColor(k, _arg_2);
        }

        private function _Str_17449(k:IItemListWindow):void
        {
            var _local_3:IWindowContainer;
            var _local_2:int;
            while (_local_2 < _Str_3114)
            {
                _local_3 = IWindowContainer(k.getListItemAt(_local_2));
                _local_3.color = this.getBgColor(_local_2, false);
                _local_2++;
            }
        }

        public function get _Str_20232():int
        {
            return this._Str_6933;
        }
    }
}
