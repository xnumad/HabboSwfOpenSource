package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7512 implements IMessageParser 
    {
        private var _floorType:String = null;
        private var _wallType:String = null;
        private var _landscapeType:String = null;
        private var _Str_18118:String = null;


        public function get _Str_5207():String
        {
            return this._floorType;
        }

        public function get _Str_5259():String
        {
            return this._wallType;
        }

        public function get _Str_5109():String
        {
            return this._landscapeType;
        }

        public function get _Str_25889():String
        {
            return this._Str_18118;
        }

        public function flush():Boolean
        {
            this._floorType = null;
            this._wallType = null;
            this._landscapeType = null;
            this._Str_18118 = null;
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
                    this._Str_18118 = _local_3;
                    break;
            }
            return true;
        }
    }
}
