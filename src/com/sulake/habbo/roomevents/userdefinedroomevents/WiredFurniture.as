package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
	import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class WiredFurniture
    {
        public function get code():int
        {
            return -1;
        }

        public function get negativeCode():int
        {
            return -1;
        }

        public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5431;
        }

        public function get hasStateSnapshot():Boolean
        {
            return false;
        }

        public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            return new Array();
        }

        public function readStringParamFromForm(k:IWindowContainer):String
        {
            return "";
        }

        public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
        }

        public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
        }

        public function get hasSpecialInputs():Boolean
        {
            return false;
        }

        public function validate(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):String
        {
            return null;
        }
    }
}
