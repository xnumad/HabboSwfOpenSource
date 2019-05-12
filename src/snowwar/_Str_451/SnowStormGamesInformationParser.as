package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGamesInformationParser implements IMessageParser 
    {
        public static const _SafeStr_18968:int = 0;
        public static const _SafeStr_21904:int = 1;
        public static const _SafeStr_21905:int = 2;
        public static const _SafeStr_21906:int = 3;

        private var _status:int;
        private var _timeTillNextGame:int;
        private var _userId:int;
        private var _gamesLeft:int;

        public function get status():int
        {
            return this._status;
        }

        public function get timeTillNextGame():int
        {
            return this._timeTillNextGame;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get gamesLeft():int
        {
            return this._gamesLeft;
        }

        public function get infiniteGames():Boolean
        {
            return this._gamesLeft == -1;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = k.readInteger();
            this._timeTillNextGame = k.readInteger();
            this._userId = k.readInteger();
            this._gamesLeft = k.readInteger();
            return true;
        }
    }
}
