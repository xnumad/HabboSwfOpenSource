package adobe.serialization.json
{
    public final class JSONToken 
    {
        internal static const token:JSONToken = new (JSONToken)();

        public var type:int;
        public var value:Object;

        public function JSONToken(_arg_1:int=-1, value:Object=null)
        {
            this.type = _arg_1;
            this.value = value;
        }

        internal static function create(_arg_1:int=-1, value:Object=null):JSONToken
        {
            token.type = _arg_1;
            token.value = value;
            return token;
        }
    }
}//package adobe.serialization.json
