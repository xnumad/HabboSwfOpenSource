package com.sulake.habbo.communication.messages.parser.mysterybox
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7374 implements IMessageParser 
    {
        private var _contentType:String;
        private var _Str_2825:int;


        public function flush():Boolean
        {
            this._contentType = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._contentType = k.readString();
            this._Str_2825 = k.readInteger();
            return true;
        }

        public function get contentType():String
        {
            return this._contentType;
        }

        public function get classId():int
        {
            return this._Str_2825;
        }
    }
}
