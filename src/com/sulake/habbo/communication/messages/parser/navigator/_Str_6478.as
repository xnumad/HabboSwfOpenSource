package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6478 implements IMessageParser 
    {
        private var _nodes:Array;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._nodes = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._nodes.push(new _Str_2802(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._nodes = null;
            return true;
        }

        public function get nodes():Array
        {
            return this._nodes;
        }
    }
}
