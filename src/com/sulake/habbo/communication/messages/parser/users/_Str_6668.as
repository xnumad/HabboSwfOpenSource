package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2891;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6668 implements IMessageParser 
    {
        private var _groupId:int;
        private var _requester:_Str_2891;


        public function flush():Boolean
        {
            this._requester = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._groupId = k.readInteger();
            this._requester = new _Str_2891(k);
            return true;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get requester():_Str_2891
        {
            return this._requester;
        }
    }
}
