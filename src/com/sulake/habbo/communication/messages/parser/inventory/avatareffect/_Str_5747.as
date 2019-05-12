package com.sulake.habbo.communication.messages.parser.inventory.avatareffect
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5511;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5747 implements IMessageParser 
    {
        private var _effects:Array;


        public function flush():Boolean
        {
            this._effects = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:_Str_5511;
            this._effects = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_5511();
                _local_4.type = k.readInteger();
                _local_4._Str_3882 = k.readInteger();
                _local_4.duration = k.readInteger();
                _local_4._Str_18572 = k.readInteger();
                _local_4._Str_12185 = k.readInteger();
                _local_4._Str_4010 = k.readBoolean();
                this._effects.push(_local_4);
                _local_3++;
            }
            return true;
        }

        public function get effects():Array
        {
            return this._effects;
        }
    }
}
