package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2GameResult 
    {
        public static const _SafeStr_18779:int = 0;
        public static const _SafeStr_18780:int = 1;
        public static const _SafeStr_18781:int = 2;

        private var _SafeStr_18782:Boolean;
        private var _SafeStr_18052:int;
        private var _SafeStr_18783:int;

        public function Game2GameResult(k:IMessageDataWrapper)
        {
            this._SafeStr_18782 = k.readBoolean();
            this._SafeStr_18052 = k.readInteger();
            this._SafeStr_18783 = k.readInteger();
        }

        public function get _SafeStr_18784():Boolean
        {
            return this._SafeStr_18782;
        }

        public function get resultType():int
        {
            return this._SafeStr_18052;
        }

        public function get _SafeStr_18785():int
        {
            return this._SafeStr_18783;
        }
    }
}








