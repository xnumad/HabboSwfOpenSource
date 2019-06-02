package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;

    public class BotFollowAvatar extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.BOT_FOLLOW_AVATAR;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5431;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453(k, "bot_name").text;
            return _local_2;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            return [this._Str_4281(k, "type_selector").getSelected().id];
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_2453(k, "bot_name").text = _arg_2.stringData;
            this._Str_4281(k, "type_selector").setSelected(this._Str_10005(k, ("radio_" + _arg_2.intData[0])));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer, _arg_2:String):ITextFieldWindow
        {
            var _local_3:ITextFieldWindow = ITextFieldWindow(k.findChildByName(_arg_2));
            return _local_3;
        }

        private function _Str_4281(k:IWindowContainer, _arg_2:String):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName(_arg_2));
        }

        private function _Str_10005(k:IWindowContainer, _arg_2:String):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName(_arg_2));
        }
    }
}
