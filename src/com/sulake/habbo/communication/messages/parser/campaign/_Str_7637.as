package com.sulake.habbo.communication.messages.parser.campaign
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7637 implements IMessageParser 
    {
        private var _Str_17229:Boolean;
        private var _productName:String;
        private var _customImage:String;
        private var _Str_6002:String;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_17229 = k.readBoolean();
            this._productName = k.readString();
            this._customImage = k.readString();
            this._Str_6002 = k.readString();
            return true;
        }

        public function flush():Boolean
        {
            this._Str_17229 = false;
            this._productName = null;
            this._customImage = null;
            this._Str_6002 = null;
            return true;
        }

        public function get _Str_22341():Boolean
        {
            return this._Str_17229;
        }

        public function get productName():String
        {
            return this._productName;
        }

        public function get customImage():String
        {
            return this._customImage;
        }

        public function get _Str_8979():String
        {
            return this._Str_6002;
        }
    }
}
