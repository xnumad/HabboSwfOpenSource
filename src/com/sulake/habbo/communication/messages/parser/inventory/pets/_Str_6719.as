package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.pets._Str_3763;
    import com.sulake.habbo.communication.messages.incoming.room.pets._Str_5753;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6719 implements IMessageParser 
    {
        private var _Str_5743:int;
        private var _pet1:_Str_3763;
        private var _pet2:_Str_3763;
        private var _Str_4447:Array;
        private var _Str_21973:int;


        public function flush():Boolean
        {
            var k:_Str_5753;
            this._Str_5743 = 0;
            if (this._pet1)
            {
                this._pet1.dispose();
                this._pet1 = null;
            }
            if (this._pet2)
            {
                this._pet2.dispose();
                this._pet2 = null;
            }
            for each (k in this._Str_4447)
            {
                k.dispose();
            }
            this._Str_4447 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_5743 = k.readInteger();
            this._pet1 = new _Str_3763(k);
            this._pet2 = new _Str_3763(k);
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_4447.push(new _Str_5753(k));
                _local_3++;
            }
            this._Str_21973 = k.readInteger();
            return true;
        }

        public function get _Str_12369():int
        {
            return this._Str_5743;
        }

        public function get pet1():_Str_3763
        {
            return this._pet1;
        }

        public function get pet2():_Str_3763
        {
            return this._pet2;
        }

        public function get _Str_10346():Array
        {
            return this._Str_4447;
        }

        public function get _Str_24905():int
        {
            return this._Str_21973;
        }
    }
}
