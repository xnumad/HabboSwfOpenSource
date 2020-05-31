package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomPropertyMessageParser implements IMessageParser
    {
        private var _floorType:String = null;
        private var _wallType:String = null;
        private var _landscapeType:String = null;
        private var _animatedLandscapeType:String = null;


        public function get floorType():String
        {
            return this._floorType;
        }

        public function get wallType():String
        {
            return this._wallType;
        }

        public function get landscapeType():String
        {
            return this._landscapeType;
        }

        public function get animatedLandscapeType():String
        {
            return this._animatedLandscapeType;
        }

        public function flush():Boolean
        {
            this._floorType = null;
            this._wallType = null;
            this._landscapeType = null;
            this._animatedLandscapeType = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:String = k.readString();
            var _local_3:String = k.readString();
            switch (_local_2)
            {
                case "floor":
                    this._floorType = _local_3;
                    break;
                case "wallpaper":
                    this._wallType = _local_3;
                    break;
                case "landscape":
                    this._landscapeType = _local_3;
                    break;
                case "landscapeanim":
                    this._animatedLandscapeType = _local_3;
                    break;
            }
            return true;
        }
    }
}
