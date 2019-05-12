package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9447 implements IMessageParser 
    {
        private var _Str_19533:String;


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19533 = k.readString();
            return true;
        }

        public function get _Str_23798():String
        {
            return this._Str_19533;
        }
    }
}
