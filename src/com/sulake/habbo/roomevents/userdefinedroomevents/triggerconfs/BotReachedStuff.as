package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class BotReachedStuff extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.BOT_REACHED_STUFF;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4991;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            return this._Str_2453(k).text;
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
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("bot_name"));
            return _local_2;
        }
    }
}
