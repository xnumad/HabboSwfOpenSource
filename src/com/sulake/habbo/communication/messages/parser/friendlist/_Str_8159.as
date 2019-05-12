package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3696;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8159 implements IMessageParser 
    {
        private var _friends:Array;
        private var _others:Array;


        public function flush():Boolean
        {
            this._friends = new Array();
            this._others = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._friends.push(new _Str_3696(k));
                _local_3++;
            }
            var _local_4:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                this._others.push(new _Str_3696(k));
                _local_3++;
            }
            return true;
        }

        public function get friends():Array
        {
            return this._friends;
        }

        public function get others():Array
        {
            return this._others;
        }
    }
}
