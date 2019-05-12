package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8488 implements IMessageParser 
    {
        private var _productName:String = "";
        private var _productDescription:String = "";


        public function flush():Boolean
        {
            this._productDescription = "";
            this._productName = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._productDescription = k.readString();
            this._productName = k.readString();
            return true;
        }

        public function get productName():String
        {
            return this._productName;
        }

        public function get productDescription():String
        {
            return this._productDescription;
        }
    }
}
