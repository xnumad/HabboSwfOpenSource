package com.sulake.habbo.communication.messages.parser.inventory.avatareffect
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AvatarEffectAddedMessageParser implements IMessageParser
    {
        private var _type:int;
        private var _subType:int;
        private var _duration:int;
        private var _Str_5145:Boolean;


        public function flush():Boolean
        {
            this._type = 0;
            this._subType = 0;
            this._duration = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._type = k.readInteger();
            this._subType = k.readInteger();
            this._duration = k.readInteger();
            this._Str_5145 = k.readBoolean();
            return true;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get subType():int
        {
            return this._subType;
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
