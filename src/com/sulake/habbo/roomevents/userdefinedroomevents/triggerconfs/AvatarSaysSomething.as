package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class AvatarSaysSomething extends WiredTrigger 
    {
        override public function get code():int
        {
            return WiredTriggerType.AVATAR_SAYS_SOMETHING;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(((this._Str_20767(k)._Str_2365) ? 1 : 0));
            return _local_2;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            return this._Str_2453(k).text;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            k.findChildByName("me_txt").caption = _arg_2.userName;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_2453(k).text = _arg_2.stringData;
            if (((_arg_2.intData.length > 0) && (_arg_2.intData[0] == 1)))
            {
                this._Str_4281(k).setSelected(this._Str_20767(k));
            }
            else
            {
                this._Str_4281(k).setSelected(this._Str_16153(k));
            }
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("chat_txt"));
            return _local_2;
        }

        private function _Str_16153(k:IWindowContainer):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName("any_avatar_radio"));
        }

        private function _Str_20767(k:IWindowContainer):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName("me_radio"));
        }

        private function _Str_4281(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("avatar_radio"));
        }
    }
}
