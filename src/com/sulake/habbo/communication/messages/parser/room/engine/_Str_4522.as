package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4522 implements IMessageParser 
    {
        private var _Str_21881:int;
        private var _owner:Boolean;


        public function get _Str_6550():int
        {
            return this._Str_21881;
        }

        public function get owner():Boolean
        {
            return this._owner;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21881 = k.readInteger();
            this._owner = k.readBoolean();
            return true;
        }
    }
}
