package com.sulake.habbo.communication.messages.parser.perk
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class PerkAllowancesMessageParser implements IMessageParser 
    {
        private var _perks:Vector.<_Str_3818>;


        public function flush():Boolean
        {
            this._perks = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:_Str_3818;
            this._perks = new Vector.<_Str_3818>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_3818();
                _local_4.code = k.readString();
                _local_4.errorMessage = k.readString();
                _local_4.isAllowed = k.readBoolean();
                this._perks.push(_local_4);
                _local_3++;
            }
            return true;
        }

        public function _Str_23301():Vector.<_Str_3818>
        {
            return this._perks;
        }

        public function isPerkAllowed(k:String):Boolean
        {
            var _local_2:_Str_3818 = this._Str_23560(k);
            return (!(_local_2 == null)) && (_local_2.isAllowed);
        }

        public function _Str_23560(k:String):_Str_3818
        {
            var _local_2:_Str_3818;
            for each (_local_2 in this._perks)
            {
                if (_local_2.code == k)
                {
                    return _local_2;
                }
            }
            return null;
        }
    }
}
