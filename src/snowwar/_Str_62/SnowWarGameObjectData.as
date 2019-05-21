package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameObjectData 
    {
        public static const OBJECT_TYPE_SNOWBALL:int = 1;
        public static const OBJECT_TYPE_TREE:int = 2;
        public static const OBJECT_TYPE_SNOWBALL_PILE:int = 3;
        public static const OBJECT_TYPE_SNOWBALL_MACHINE:int = 4;
        public static const OBJECT_TYPE_HUMAN:int = 5;

        protected var _variables:Array;

        public function SnowWarGameObjectData(k:int, _arg_2:int)
        {
            this._variables = [];
            super();
            this.setVariable(0, k);
            this.setVariable(1, _arg_2);
        }

        public static function create(k:int, _arg_2:int):SnowWarGameObjectData
        {
            switch (k)
            {
                case OBJECT_TYPE_SNOWBALL:
                    return new _SafeStr_3587(k, _arg_2);
                case OBJECT_TYPE_SNOWBALL_MACHINE:
                    return new _SafeStr_3585(k, _arg_2);
                case OBJECT_TYPE_SNOWBALL_PILE:
                    return new _SafeStr_3586(k, _arg_2);
                case OBJECT_TYPE_HUMAN:
                    return new HumanGameObjectData(k, _arg_2);
                case OBJECT_TYPE_TREE:
                    return (new _SafeStr_3584(k, _arg_2)); //TreeGameObject
                default:
                    return null;
            }
        }

        public function get type():int
        {
            return this.getVariable(0);
        }

        public function get id():int
        {
            return this.getVariable(1);
        }

        public function getVariable(k:int):int
        {
            return this._variables[k];
        }

        protected function setVariable(k:int, _arg_2:int):void
        {
            this._variables[k] = _arg_2;
        }

        protected function parseVariables(k:IMessageDataWrapper, _arg_2:int):void
        {
            var _local_3:int = 2;
            while (_local_3 < _arg_2)
            {
                this._variables.push(k.readInteger());
                _local_3++;
            }
        }

        public function parse(k:IMessageDataWrapper):void
        {
        }
    }
}
