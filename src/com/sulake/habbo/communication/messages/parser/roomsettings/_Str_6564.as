package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6564 implements IMessageParser 
    {
        private var _Str_19797:Boolean;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19797 = k.readBoolean();
            return true;
        }

        public function get _Str_20186():Boolean
        {
            return this._Str_19797;
        }

        public function flush():Boolean
        {
            return true;
        }
    }
}
