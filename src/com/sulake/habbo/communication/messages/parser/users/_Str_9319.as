package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3266;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9319 implements IMessageParser 
    {
        private var _guilds:Array;

        public function _Str_9319()
        {
            this._guilds = new Array();
            super();
        }

        public function flush():Boolean
        {
            this._guilds = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._guilds.push(new _Str_3266(k));
                _local_3++;
            }
            return true;
        }

        public function get guilds():Array
        {
            return this._guilds;
        }
    }
}
