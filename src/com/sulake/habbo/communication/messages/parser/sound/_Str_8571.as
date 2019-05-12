package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8571 implements IMessageParser 
    {
        private var _Str_2808:int;
        private var _Str_7881:String;


        public function flush():Boolean
        {
            this._Str_2808 = 0;
            this._Str_7881 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7881 = k.readString();
            this._Str_2808 = k.readInteger();
            return true;
        }

        public function get _Str_3951():int
        {
            return this._Str_2808;
        }

        public function get _Str_25744():String
        {
            return this._Str_7881;
        }
    }
}
