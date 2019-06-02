package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3560;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11792;
    import com.sulake.core.window.events.WindowEvent;

    public class RoomAdListCtrl extends GuestRoomListCtrl 
    {
        public function RoomAdListCtrl(k:HabboNavigator, _arg_2:int, _arg_3:Boolean)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function getListEntry(k:int):IWindowContainer
        {
            var _local_2:IWindowContainer = IWindowContainer(_Str_2272.getXmlWindow("grs_room_ads_details_phase_one"));
            _local_2.background = true;
            _local_2.addEventListener(WindowMouseEvent.MOVE, _Str_4955);
            _local_2.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_2.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH, true);
            _local_2.color = getBgColor(k);
            _local_2.tags.push(k);
            return _local_2;
        }

        override protected function refreshEntryDetails(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            k.visible = true;
            var _local_3:ITextWindow = ITextWindow(k.getChildByName("adname"));
            _local_3.visible = true;
            Util._Str_21212(_local_3, _arg_2._Str_8163, k.width);
            _Str_2272.refreshButton(k, "doormode_doorbell_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_CLOSED), null, 0);
            _Str_2272.refreshButton(k, "doormode_password_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_PASSWORD), null, 0);
            _Str_2272.refreshButton(k, "doormode_invisible_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_INVISIBLE), null, 0);
            _Str_3220.refreshUserCount(_arg_2._Str_9029, k, _arg_2.userCount, "${navigator.usercounttooltip.users}", 308, 2);
        }

        private function _Str_9465(k:int):_Str_2370
        {
            return getRooms()[k];
        }

        override protected function onMouseClick(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:int = _local_2.tags[0];
            var _local_4:_Str_2370 = this._Str_9465(_local_3);
            if (_Str_2272)
            {
                _Str_2272.send(new _Str_11792(_local_4.flatId, _local_4._Str_8163, _local_4._Str_15104));
            }
            super.onMouseClick(k);
        }
    }
}
