package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
	import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGamesLeftParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _SafeStr_13166:int;
        private var _SafeStr_18570:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get _SafeStr_13224():int
        {
            return this._SafeStr_13166;
        }

        public function get _SafeStr_13126():int
        {
            return this._SafeStr_18570;
        }

        public function get _SafeStr_13223():Boolean
        {
            return this._SafeStr_13166 == -1;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._SafeStr_13166 = k.readInteger();
            this._SafeStr_18570 = k.readInteger();
            return true;
        }
    }
}
