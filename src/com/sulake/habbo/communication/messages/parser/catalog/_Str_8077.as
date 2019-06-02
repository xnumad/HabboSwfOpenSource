package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8077 implements IMessageParser 
    {
        private var _Str_2570:String;
        private var _products:Array;


        public function flush():Boolean
        {
            this._products = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._products = new Array();
            this._Str_2570 = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._products.push(new _Str_2853(k));
                _local_3++;
            }
            return true;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get products():Array
        {
            return this._products;
        }
    }
}
