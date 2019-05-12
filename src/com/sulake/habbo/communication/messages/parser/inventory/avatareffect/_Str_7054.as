package com.sulake.habbo.communication.messages.parser.inventory.avatareffect
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7054 implements IMessageParser 
    {
        private var _type:int;


        public function flush():Boolean
        {
            this._type = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._type = k.readInteger();
            return true;
        }

        public function get type():int
        {
            return this._type;
        }
    }
}
