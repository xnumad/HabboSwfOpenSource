package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomVisualizationSettingsParser implements IMessageParser
    {
        private var _wallsHidden:Boolean = false;
        private var _wallThicknessMultiplier:Number = 1;
        private var _floorThicknessMultiplier:Number = 1;


        public function get wallsHidden():Boolean
        {
            return this._wallsHidden;
        }

        public function get wallThicknessMultiplier():Number
        {
            return this._wallThicknessMultiplier;
        }

        public function get floorThicknessMultiplier():Number
        {
            return this._floorThicknessMultiplier;
        }

        public function flush():Boolean
        {
            this._wallsHidden = false;
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
            this._wallsHidden = k.readBoolean();
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
