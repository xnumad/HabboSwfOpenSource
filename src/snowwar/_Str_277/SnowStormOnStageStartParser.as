package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_3610;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormOnStageStartParser implements IMessageParser 
    {
        private var _SafeStr_12654:_SafeStr_3610;
        private var _SafeStr_12655:int;
        private var _roomType:String;
        private var _SafeStr_12657:int;

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_12655 = k.readInteger();
            this._roomType = k.readString();
            this._SafeStr_12657 = k.readInteger();
            this._SafeStr_12654 = new _SafeStr_3610(k);
            return true;
        }

        public function get _SafeStr_7508():_SafeStr_3610
        {
            return this._SafeStr_12654;
        }

        public function get _SafeStr_12658():int
        {
            return this._SafeStr_12655;
        }

        public function get roomType():String
        {
            return this._roomType;
        }

        public function get _SafeStr_12659():int
        {
            return this._SafeStr_12657;
        }
    }
}
