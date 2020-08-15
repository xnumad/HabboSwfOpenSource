package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AcceptFriendFailureData
    {
        private var _senderId:int;
        private var _errorCode:int;

        public function AcceptFriendFailureData(k:IMessageDataWrapper)
        {
            this._senderId = k.readInteger();
            this._errorCode = k.readInteger();
        }

        public function get senderId():int
        {
            return this._senderId;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}
