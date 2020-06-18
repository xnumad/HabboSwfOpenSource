package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendCategoryData
    {
        private var _id:int;
        private var _name:String;

        public function FriendCategoryData(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._name = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
