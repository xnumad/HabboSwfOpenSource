package snowwar._Str_496
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4638;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarFurnitureObject 
    {
        private var _name:String;
        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _width:int;
        private var _length:int;
        private var _height:int;
        private var _direction:int;
        private var _altitude:int;
        private var _walkable:Boolean;
        private var _extradata:IStuffData;


        public function parse(k:IMessageDataWrapper):void
        {
            this._name = k.readString();
            this._id = k.readInteger();
            this._x = k.readInteger();
            this._y = k.readInteger();
            this._width = k.readInteger();
            this._length = k.readInteger();
            this._height = k.readInteger();
            this._direction = k.readInteger();
            this._altitude = k.readInteger();
            this._walkable = k.readBoolean();
            this._extradata = _Str_4638._Str_6271(k);
        }

        public function get name():String
        {
            return this._name;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get width():int
        {
            return this._width;
        }

        public function get length():int
        {
            return this._length;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get direction():int
        {
            return this._direction;
        }

        public function get altitude():int
        {
            return this._altitude;
        }

        public function get walkable():Boolean
        {
            return this._walkable;
        }

        public function get extradata():IStuffData
        {
            return this._extradata;
        }
    }
}

















