package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_7573;

    public class UserRightsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserRightsMessageEvent(k:Function)
        {
            super(k, _Str_7573);
        }

        public function get clubLevel():int
        {
            return (this._parser as _Str_7573).clubLevel;
        }

        public function get securityLevel():int
        {
            return (this._parser as _Str_7573).securityLevel;
        }

        public function get _Str_4050():Boolean
        {
            return (this._parser as _Str_7573)._Str_4050;
        }
    }
}
