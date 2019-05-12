package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6671 implements IMessageParser 
    {
        private var _Str_2992:String = "";


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2992 = k.readString();
            return true;
        }

        public function get _Str_3460():String
        {
            return this._Str_2992;
        }
    }
}
