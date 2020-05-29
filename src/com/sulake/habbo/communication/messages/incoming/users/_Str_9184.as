package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.IgnoredUsersMessageParser;

    public class _Str_9184 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9184(k:Function)
        {
            super(k, IgnoredUsersMessageParser);
        }

        public function get ignoredUsers():Array
        {
            return (_parser as IgnoredUsersMessageParser).ignoredUsers;
        }
    }
}
