package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3742;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7531 implements IMessageParser 
    {
        private var _Str_18741:int;
        private var _Str_18290:Array;


        public function flush():Boolean
        {
            this._Str_18290 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18741 = k.readInteger();
            var _local_2:int = k.readInteger();
            Logger.log(((("Received friend requests: " + this._Str_18741) + ", ") + _local_2));
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_18290.push(new _Str_3742(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_26150():int
        {
            return this._Str_18741;
        }

        public function get _Str_17539():Array
        {
            return this._Str_18290;
        }
    }
}
