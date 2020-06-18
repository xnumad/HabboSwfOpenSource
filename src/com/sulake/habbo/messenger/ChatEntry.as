package com.sulake.habbo.messenger
{
    import flash.utils.getTimer;

    public class ChatEntry 
    {
        public static const TYPE_OWN_CHAT:int = 1;
        public static const TYPE_OTHER_CHAT:int = 2;
        public static const TYPE_NOTIFICATION:int = 3;
        public static const TYPE_INFO:int = 4;
        public static const TYPE_INVITATION:int = 5;

        private var _type:int;
        private var _senderId:int;
        private var _message:String;
        private var _secondsSinceSent:int;
        private var _clientReceiveTime:int;
        private var _extraData:String;

        public function ChatEntry(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null)
        {
            this._type = k;
            this._senderId = _arg_2;
            this._message = _arg_3;
            this._secondsSinceSent = _arg_4;
            this._clientReceiveTime = getTimer();
            this._extraData = _arg_5;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get senderId():int
        {
            return this._senderId;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get extraData():String
        {
            return this._extraData;
        }

        public function get _Str_17201():int
        {
            var k:int = ((getTimer() - this._clientReceiveTime) / 1000);
            return this._secondsSinceSent + k;
        }

        public function _Str_22172():Number
        {
            return new Date().getTime() - (this._Str_17201 * 1000);
        }

        public function _Str_19910(k:String):void
        {
            this._message = ((k + "\n") + this._message);
        }
    }
}
