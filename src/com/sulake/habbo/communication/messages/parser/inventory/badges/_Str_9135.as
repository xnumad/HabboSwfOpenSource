package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9135 implements IMessageParser 
    {
        private var _Str_10244:String;
        private var _Str_22220:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_10244 = k.readString();
            this._Str_22220 = k.readBoolean();
            return true;
        }

        public function get _Str_25181():String
        {
            return this._Str_10244;
        }

        public function get _Str_25366():Boolean
        {
            return this._Str_22220;
        }
    }
}
