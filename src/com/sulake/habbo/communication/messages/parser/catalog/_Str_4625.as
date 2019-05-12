package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4625 implements IMessageParser 
    {
        private var _pageName:String;
        private var _Str_5158:int;
        private var _image:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._pageName = k.readString();
            this._Str_5158 = k.readInteger();
            this._image = k.readString();
            return true;
        }

        public function get pageName():String
        {
            return this._pageName;
        }

        public function get _Str_17123():int
        {
            return this._Str_5158;
        }

        public function get image():String
        {
            return this._image;
        }
    }
}
