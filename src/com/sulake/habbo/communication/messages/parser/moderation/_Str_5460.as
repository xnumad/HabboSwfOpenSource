package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5460 implements IMessageParser 
    {
        private var _Str_13730:_Str_2484;


        public function get _Str_22192():_Str_2484
        {
            return this._Str_13730;
        }

        public function flush():Boolean
        {
            if (this._Str_13730)
            {
            }
            this._Str_13730 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int = k.readInteger();
            var _local_4:int = k.readInteger();
            var _local_5:int = k.readInteger();
            var _local_6:Number = k.readInteger();
            var _local_7:int = k.readInteger();
            var _local_8:int = k.readInteger();
            var _local_9:int = k.readInteger();
            var _local_10:String = k.readString();
            var _local_11:int = k.readInteger();
            var _local_12:String = k.readString();
            var _local_13:int = k.readInteger();
            var _local_14:String = k.readString();
            var _local_15:String = k.readString();
            var _local_16:int = k.readInteger();
            var _local_17:int = k.readInteger();
            var _local_18:Array = [];
            var _local_19:int;
            while (_local_19 < _local_17)
            {
                _local_18.push(new _Str_8176(k));
                _local_19++;
            }
            this._Str_13730 = new _Str_2484(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7, _local_8, _local_9, _local_10, _local_11, _local_12, _local_13, _local_14, _local_15, _local_16, _local_18);
            return true;
        }
    }
}
