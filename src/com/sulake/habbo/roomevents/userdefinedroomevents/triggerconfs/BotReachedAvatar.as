package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class BotReachedAvatar extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.BOT_REACHED_AVATAR;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5431;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            return this.getInput(k).text;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this.getInput(k).text = _arg_2.stringData;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function getInput(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("bot_name"));
            return _local_2;
        }
    }
}
