package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496.Game2PlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4568 implements IMessageParser 
    {
        private var _SafeStr_14869:Game2PlayerData;

        public function flush():Boolean
        {
            if (this._SafeStr_14869)
            {
                this._SafeStr_14869.dispose();
                this._SafeStr_14869 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_14869 = new Game2PlayerData();
            this._SafeStr_14869.parse(k);
            return true;
        }

        public function get player():Game2PlayerData
        {
            return this._SafeStr_14869;
        }
    }
}
