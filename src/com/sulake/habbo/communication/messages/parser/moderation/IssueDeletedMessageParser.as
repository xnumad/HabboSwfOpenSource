package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IssueDeletedMessageParser implements IMessageParser
    {
        private var _issueId:int;


        public function get _Str_2869():int
        {
            return this._issueId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._issueId = parseInt(k.readString());
            return true;
        }
    }
}
