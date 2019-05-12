package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamPlayerData 
    {
        private var _userId:int;
        private var _userName:String;
        private var _score:int;
        private var _figure:String;
        private var _gender:String;
        private var _playerStats:Game2PlayerStatsData;
        private var _final:int;
        private var _SafeStr_22181:Boolean;

        public function Game2TeamPlayerData(k:int, _arg_2:IMessageDataWrapper):void
        {
            this._final = k;
            this._userName = _arg_2.readString();
            this._userId = _arg_2.readInteger();
            this._figure = _arg_2.readString();
            this._gender = _arg_2.readString();
            this._score = _arg_2.readInteger();
            this._playerStats = new Game2PlayerStatsData(_arg_2);
            this._SafeStr_22181 = false;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get score():int
        {
            return this._score;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get playerStats():Game2PlayerStatsData
        {
            return this._playerStats;
        }

        public function get final():int
        {
            return this._final;
        }

        public function get _SafeStr_18910():Boolean
        {
            return this._SafeStr_22181;
        }

        public function set _SafeStr_18910(k:Boolean):void
        {
            this._SafeStr_22181 = k;
        }
    }
}
