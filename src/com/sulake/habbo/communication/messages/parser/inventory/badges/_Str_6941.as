package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6941 implements IMessageParser 
    {
        private var _Str_13713:Array;
        private var _Str_13962:Array;
        private var _Str_4833:Map;


        public function flush():Boolean
        {
            this._Str_13713 = [];
            this._Str_13962 = [];
            if (this._Str_4833)
            {
                this._Str_4833.dispose();
                this._Str_4833 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:String;
            var _local_8:int;
            this._Str_13713 = new Array();
            this._Str_4833 = new Map();
            var _local_4:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._Str_4833.add(_local_3, _local_2);
                this._Str_13713.push(_local_3);
                _local_5++;
            }
            this._Str_13962 = new Array();
            var _local_6:int = k.readInteger();
            var _local_7:int;
            while (_local_7 < _local_6)
            {
                _local_8 = k.readInteger();
                _local_3 = k.readString();
                this._Str_13962.push(_local_3);
                _local_7++;
            }
            return true;
        }

        public function getBadgeId(k:String):int
        {
            return this._Str_4833.getValue(k);
        }

        public function _Str_21415():Array
        {
            return this._Str_13713;
        }

        public function _Str_23681():Array
        {
            return this._Str_13962;
        }
    }
}
