package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendsListFragmentMessageParser implements IMessageParser
    {
        protected var _totalFragments:int;
        protected var _fragmentNo:int;
        private var _friendFragment:Array;


        public function get totalFragments():int
        {
            return this._totalFragments;
        }

        public function get fragmentNo():int
        {
            return this._fragmentNo;
        }

        public function get friendFragment():Array
        {
            return this._friendFragment;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._totalFragments = k.readInteger();
            this._fragmentNo = k.readInteger();
            this._friendFragment = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._friendFragment.push(new FriendParser(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._friendFragment = new Array();
            return true;
        }
    }
}
