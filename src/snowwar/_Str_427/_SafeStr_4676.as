package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4676 extends _SafeStr_4020 
    {
        private var _SafeStr_22183:HumanGameObject;

        public function _SafeStr_4676(k:HumanGameObject)
        {
            this._SafeStr_22183 = k;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22183 = null;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            this._SafeStr_22183._SafeStr_18849();
        }

        public function get _SafeStr_22184():HumanGameObject
        {
            return this._SafeStr_22183;
        }
    }
}
