package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendRequestData
    {
        private var _requestId:int;
        private var _requesterName:String;
        private var _requesterUserId:int;
        private var _figureString:String;

        public function FriendRequestData(k:IMessageDataWrapper)
        {
            this._requestId = k.readInteger();
            this._requesterName = k.readString();
            this._figureString = k.readString();
            this._requesterUserId = this._requestId;
        }

        public function get requestId():int
        {
            return this._requestId;
        }

        public function get requesterName():String
        {
            return this._requesterName;
        }

        public function get requesterUserId():int
        {
            return this._requesterUserId;
        }

        public function get figureString():String
        {
            return this._figureString;
        }
    }
}
