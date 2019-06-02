package com.sulake.habbo.communication.messages.parser.mysterybox
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7765 implements IMessageParser 
    {
        private var _Str_9099:String;
        private var _Str_8398:String;


        public function flush():Boolean
        {
            this._Str_9099 = null;
            this._Str_8398 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_9099 = k.readString();
            this._Str_8398 = k.readString();
            return true;
        }

        public function get boxColor():String
        {
            return this._Str_9099;
        }

        public function get keyColor():String
        {
            return this._Str_8398;
        }
    }
}
