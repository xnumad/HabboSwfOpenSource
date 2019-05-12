package snowwar
{
    import snowwar._Str_231._SafeStr_4033;
    import snowwar._Str_231.SynchronizedGameArena;
    import snowwar._Str_231._SafeStr_4024;

    public class _SafeStr_4034 implements _SafeStr_4033 
    {
        private var _gameArena:SynchronizedGameArena;
        private var _disposed:Boolean = false;


        public function dispose():void
        {
            this._disposed = true;
            this._gameArena = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set synchronizedGameArena(k:SynchronizedGameArena):void
        {
            this._gameArena = k;
        }

        public function _SafeStr_13253():int
        {
            return 50;
        }

        public function maxSubTurns():int
        {
            return 3;
        }

        public function createStage():_SafeStr_4024
        {
            return new SnowWarGameStage();
        }

        public function handleTurn():void
        {
        }

        public function _SafeStr_18784():Boolean
        {
            return this._gameArena._SafeStr_13274 == 1;
        }
    }
}
