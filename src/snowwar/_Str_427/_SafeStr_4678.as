package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4678 extends _SafeStr_4020 
    {
        private var _SafeStr_22183:HumanGameObject;

        public function _SafeStr_4678(k:HumanGameObject)
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
            k._SafeStr_18710(this._SafeStr_22183);
            this._SafeStr_22183.onRemove();
        }
    }
}
