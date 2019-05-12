package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameObjectData 
    {
        public static const _SafeStr_12568:int = 1;
        public static const _SafeStr_12569:int = 2;
        public static const _SafeStr_12570:int = 3;
        public static const _SafeStr_12571:int = 4;
        public static const _SafeStr_12572:int = 5;

        protected var _SafeStr_12573:Array;

        public function SnowWarGameObjectData(k:int, _arg_2:int)
        {
            this._SafeStr_12573 = [];
            super();
            this._SafeStr_12574(0, k);
            this._SafeStr_12574(1, _arg_2);
        }

        public static function create(k:int, _arg_2:int):SnowWarGameObjectData
        {
            switch (k)
            {
                case _SafeStr_12568:
                    return new _SafeStr_3587(k, _arg_2);
                case _SafeStr_12571:
                    return new _SafeStr_3585(k, _arg_2);
                case _SafeStr_12570:
                    return new _SafeStr_3586(k, _arg_2);
                case _SafeStr_12572:
                    return new _SafeStr_2467(k, _arg_2);
                case _SafeStr_12569:
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
            return this._SafeStr_12573[k];
        }

        protected function _SafeStr_12574(k:int, _arg_2:int):void
        {
            this._SafeStr_12573[k] = _arg_2;
        }

        protected function _SafeStr_12575(k:IMessageDataWrapper, _arg_2:int):void
        {
            var _local_3:int = 2;
            while (_local_3 < _arg_2)
            {
                this._SafeStr_12573.push(k.readInteger());
                _local_3++;
            }
        }

        public function parse(k:IMessageDataWrapper):void
        {
        }
    }
}
