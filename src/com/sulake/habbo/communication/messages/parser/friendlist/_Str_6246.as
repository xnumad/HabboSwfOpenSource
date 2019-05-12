package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3742;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6246 implements IMessageParser 
    {
        private var _req:_Str_3742;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._req = new _Str_3742(k);
            return true;
        }

        public function get req():_Str_3742
        {
            return this._req;
        }
    }
}
