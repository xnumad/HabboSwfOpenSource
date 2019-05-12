package com.sulake.habbo.communication.messages.parser.friendfurni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9391 implements IMessageParser 
    {
        private var _stuffId:int;
        private var _Str_4514:Boolean;


        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get _Str_3233():Boolean
        {
            return this._Str_4514;
        }

        public function flush():Boolean
        {
            this._stuffId = -1;
            this._Str_4514 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffId = k.readInteger();
            this._Str_4514 = k.readBoolean();
            return true;
        }
    }
}
