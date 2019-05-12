package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7034 
    {
        private var _senderId:int;
        private var _errorCode:int;

        public function _Str_7034(k:IMessageDataWrapper)
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
