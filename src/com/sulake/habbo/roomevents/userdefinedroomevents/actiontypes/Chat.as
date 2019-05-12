package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;

    public class Chat extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.CHAT;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453(k).text;
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_2453(k).text = _arg_2.stringData;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("chat_message"));
            return _local_2;
        }

        override public function validate(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):String
        {
            var _local_4:String;
            var _local_3:int = 100;
            if (this._Str_2453(k).text.length > _local_3)
            {
                _local_4 = "wiredfurni.chatmsgtoolong";
                return _arg_2.localization.getLocalization(_local_4, _local_4);
            }
            return null;
        }
    }
}
