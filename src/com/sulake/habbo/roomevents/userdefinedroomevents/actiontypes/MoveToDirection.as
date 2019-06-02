package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class MoveToDirection extends DefaultActionType 
    {


        override public function get code():int
        {
            return ActionTypeCodes.MOVE_TO_DIRECTION;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5430;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _arg_2.refreshButton(k, "move_0", true, null, 0);
            _arg_2.refreshButton(k, "move_2", true, null, 0);
            _arg_2.refreshButton(k, "move_4", true, null, 0);
            _arg_2.refreshButton(k, "move_6", true, null, 0);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = _arg_2.intData[0];
            var _local_4:int = _arg_2.intData[1];
            this._Str_22058(k).setSelected(this._Str_24927(k, _local_3));
            this._Str_21411(k).setSelected(this._Str_22820(k, _local_4));
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._Str_22058(k).getSelected().id);
            _local_2.push(this._Str_21411(k).getSelected().id);
            return _local_2;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_24927(k:IWindowContainer, _arg_2:int):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName((("startdir_" + _arg_2) + "_radio")));
        }

        private function _Str_22820(k:IWindowContainer, _arg_2:int):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName((("turn_" + _arg_2) + "_radio")));
        }

        private function _Str_22058(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("startdir_selector"));
        }

        private function _Str_21411(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("turn_selector"));
        }
    }
}
