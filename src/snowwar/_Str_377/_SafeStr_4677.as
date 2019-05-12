package snowwar._Str_377
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4677 
    {
        public static const _SafeStr_18990:int = 1;
        public static const _SafeStr_18987:int = 2;
        public static const _SafeStr_18988:int = 3;
        public static const _SafeStr_18989:int = 4;
        public static const _SafeStr_18985:int = 7;
        public static const _SafeStr_18983:int = 8;
        public static const _SafeStr_18986:int = 11;
        public static const _SafeStr_18984:int = 12;

        private var _id:int;

        public function _SafeStr_4677(k:int)
        {
            this._id = k;
        }

        public static function create(k:int):_SafeStr_4677
        {
            switch (k)
            {
                case _SafeStr_18987:
                    return (new _SafeStr_4689(k)); //2 //PlayerMoveEvent
                case _SafeStr_18988:
                    return (new _SafeStr_4691(k)); //3 //ThrowBallToPlayerEvent
                case _SafeStr_18989:
                    return (new _SafeStr_4688(k)); //4
                case _SafeStr_18985:
                    return (new _SafeStr_4681(k)); //7
                case _SafeStr_18983:
                    return (new _SafeStr_4687(k)); //8
                case _SafeStr_18986:
                    return (new _SafeStr_4679(k)); //11
                case _SafeStr_18984:
                    return (new _SafeStr_4686(k)); //12
                case _SafeStr_18990:
                    return (new _SafeStr_4680(k)); //1 //RemovePlayerEvent
                default:
                    return null;
            }
        }

        public function get id():int
        {
            return this._id;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function parse(k:IMessageDataWrapper):void
        {
        }
    }
}
