package com.sulake.habbo.communication.messages.parser.friendfurni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendFurniStartConfirmationMessageParser implements IMessageParser 
    {
        private var _stuffId:int;
        private var _isOwner:Boolean;


        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get _Str_3233():Boolean
        {
            return this._isOwner;
        }

        public function flush():Boolean
        {
            this._stuffId = -1;
            this._isOwner = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffId = k.readInteger();
            this._isOwner = k.readBoolean();
            return true;
        }
    }
}
