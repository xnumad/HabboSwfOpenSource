package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_7034;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7071 implements IMessageParser 
    {
        private var _Str_17671:Array;


        public function flush():Boolean
        {
            this._Str_17671 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_17671.push(new _Str_7034(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_22533():Array
        {
            return this._Str_17671;
        }
    }
}
