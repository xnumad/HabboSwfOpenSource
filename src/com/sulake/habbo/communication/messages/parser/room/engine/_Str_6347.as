package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6347 implements IMessageParser 
    {
        private var _Str_16940:Boolean = false;
        private var _wallThicknessMultiplier:Number = 1;
        private var _floorThicknessMultiplier:Number = 1;


        public function get _Str_22900():Boolean
        {
            return this._Str_16940;
        }

        public function get _Str_9955():Number
        {
            return this._wallThicknessMultiplier;
        }

        public function get _Str_9990():Number
        {
            return this._floorThicknessMultiplier;
        }

        public function flush():Boolean
        {
            this._Str_16940 = false;
            this._wallThicknessMultiplier = 1;
            this._floorThicknessMultiplier = 1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._Str_16940 = k.readBoolean();
            var _local_2:int = k.readInteger();
            var _local_3:int = k.readInteger();
            if (_local_2 < -2)
            {
                _local_2 = -2;
            }
            else
            {
                if (_local_2 > 1)
                {
                    _local_2 = 1;
                }
            }
            if (_local_3 < -2)
            {
                _local_3 = -2;
            }
            else
            {
                if (_local_3 > 1)
                {
                    _local_3 = 1;
                }
            }
            this._wallThicknessMultiplier = Math.pow(2, _local_2);
            this._floorThicknessMultiplier = Math.pow(2, _local_3);
            return true;
        }
    }
}
