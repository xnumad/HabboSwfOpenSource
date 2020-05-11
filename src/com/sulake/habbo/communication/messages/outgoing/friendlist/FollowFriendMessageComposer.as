package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class FollowFriendMessageComposer implements IMessageComposer 
    {
        private var _Str_5549:String;

        public function FollowFriendMessageComposer(k:String)
        {
            this._Str_5549 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_5549];
        }

        public function dispose():void
        {
            this._Str_5549 = null;
        }
    }
}
