package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6876;

    public class _Str_5010 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5010(k:Function)
        {
            super(k, _Str_6876);
        }

        private function getParser():_Str_6876
        {
            return this._parser as _Str_6876;
        }

        public function get figure():String
        {
            return (_parser as _Str_6876).figure;
        }

        public function get gender():String
        {
            return (_parser as _Str_6876).gender;
        }
    }
}
