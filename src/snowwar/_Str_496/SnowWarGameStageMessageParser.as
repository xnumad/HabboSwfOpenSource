package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameStageMessageParser 
    {
        private var _width:int;
        private var _height:int;
        private var _model:String;
        private var _fuseObjects:Array;

        public function SnowWarGameStageMessageParser(k:IMessageDataWrapper)
        {
            this._fuseObjects = [];
            super();
            this.parse(k);
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get model():String
        {
            return this._model;
        }

        public function get fuseObjects():Array
        {
            return this._fuseObjects;
        }

        public function parse(k:IMessageDataWrapper):void
        {
            var i:int;
            var object:SnowWarFurnitureObject;
            this._width = k.readInteger();
            this._height = k.readInteger();
            this._model = k.readString();
            var count:int = k.readInteger();
            i = 0;
            while (i < count)
            {
                object = new SnowWarFurnitureObject();
                object.parse(k);
                this._fuseObjects.push(object);
                i++;
            }
        }
    }
}
