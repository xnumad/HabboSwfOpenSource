package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9527 implements IMessageParser 
    {
        private var _Str_6800:int;
        private var _pageId:int;
        private var _Str_2507:int;
        private var _Str_3032:String;


        public function flush():Boolean
        {
            this._Str_6800 = -1;
            this._pageId = -1;
            this._Str_2507 = -1;
            this._Str_3032 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6800 = k.readInteger();
            this._pageId = k.readInteger();
            this._Str_2507 = k.readInteger();
            this._Str_3032 = k.readString();
            return true;
        }

        public function get _Str_23051():int
        {
            return this._Str_6800;
        }

        public function get pageId():int
        {
            return this._pageId;
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function get productType():String
        {
            return this._Str_3032;
        }
    }
}
