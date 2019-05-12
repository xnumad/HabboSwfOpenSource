package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8101 implements IMessageParser 
    {
        private var _groupId:int;
        private var _thread:GuildForumThread;


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get thread():GuildForumThread
        {
            return this._thread;
        }

        public function flush():Boolean
        {
            this._groupId = -1;
            this._thread = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._groupId = k.readInteger();
            this._thread = GuildForumThread.parse(k);
            return true;
        }
    }
}
