package com.sulake.habbo.communication.messages.parser.inventory.avatareffect
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7398 implements IMessageParser 
    {
        private var _type:int;
        private var _Str_4653:int;
        private var _duration:int;
        private var _Str_5145:Boolean;


        public function flush():Boolean
        {
            this._type = 0;
            this._Str_4653 = 0;
            this._duration = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._type = k.readInteger();
            this._Str_4653 = k.readInteger();
            this._duration = k.readInteger();
            this._Str_5145 = k.readBoolean();
            return true;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get _Str_3882():int
        {
            return this._Str_4653;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function get _Str_4010():Boolean
        {
            return this._Str_5145;
        }
    }
}
