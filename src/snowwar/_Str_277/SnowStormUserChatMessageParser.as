package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormUserChatMessageParser implements IMessageParser 
    {
        private var _SafeStr_9687:int;
        private var _SafeStr_21819:String;

        public function flush():Boolean
        {
            this._SafeStr_9687 = -1;
            this._SafeStr_21819 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_9687 = k.readInteger();
            this._SafeStr_21819 = k.readString();
            return true;
        }

        public function get userId():int
        {
            return this._SafeStr_9687;
        }

        public function get _SafeStr_18212():String
        {
            return this._SafeStr_21819;
        }
    }
}
