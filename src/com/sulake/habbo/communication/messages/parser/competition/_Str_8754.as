package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8754 implements IMessageParser 
    {
        private var _Str_8579:Boolean;
        private var _Str_6987:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8579 = k.readBoolean();
            this._Str_6987 = k.readInteger();
            return true;
        }

        public function get _Str_25348():Boolean
        {
            return this._Str_8579;
        }

        public function get _Str_10760():int
        {
            return this._Str_6987;
        }
    }
}
