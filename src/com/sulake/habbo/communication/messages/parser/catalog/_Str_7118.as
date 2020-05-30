package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7118 implements IMessageParser 
    {
        private var _productCode:String = "";
        private var _Str_6479:Array;

        public function _Str_7118()
        {
            this._Str_6479 = [];
            super();
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get _Str_13588():Array
        {
            return this._Str_6479.slice();
        }

        public function flush():Boolean
        {
            this._productCode = "";
            this._Str_6479 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._productCode = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_6479.push(new _Str_3140(k));
                _local_3++;
            }
            return true;
        }
    }
}
