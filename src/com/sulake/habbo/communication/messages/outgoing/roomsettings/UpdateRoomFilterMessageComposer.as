package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class UpdateRoomFilterMessageComposer implements IMessageComposer, IDisposable 
    {
        public static var _Str_16408:Boolean = true;
        public static var _Str_16962:Boolean = false;

        private var messageArray:Array;

        public function UpdateRoomFilterMessageComposer(k:int, _arg_2:Boolean, _arg_3:String)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
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
            return false;
        }
    }
}
