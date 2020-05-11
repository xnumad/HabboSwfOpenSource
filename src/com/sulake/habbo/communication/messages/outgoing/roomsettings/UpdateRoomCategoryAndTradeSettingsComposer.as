package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class UpdateRoomCategoryAndTradeSettingsComposer implements IMessageComposer, IDisposable 
    {
        private var messageArray:Array;

        public function UpdateRoomCategoryAndTradeSettingsComposer(k:int, _arg_2:int, _arg_3:int)
        {
            this.messageArray = new Array();
            super();
            this.messageArray = [k, _arg_2, _arg_3];
        }

        public function getMessageArray():Array
        {
            return this.messageArray;
        }

        public function dispose():void
        {
            this.messageArray = null;
        }

        public function get disposed():Boolean
        {
            return this.messageArray == null;
        }
    }
}
