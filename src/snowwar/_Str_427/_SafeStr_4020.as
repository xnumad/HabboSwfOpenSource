package snowwar._Str_427
{
    import snowwar._Str_231._SafeStr_4019;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4020 implements _SafeStr_4019 
    {
        private var _disposed:Boolean = false;

        public function apply(k:SynchronizedGameStage):void
        {
        }

        public function dispose():void
        {
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
