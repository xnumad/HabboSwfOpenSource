package snowwar._Str_427
{
    import snowwar._Str_39._SafeStr_4672;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4682 extends _SafeStr_4020 
    {
        private var _SafeStr_22190:_SafeStr_4672;

        public function _SafeStr_4682(k:_SafeStr_4672)
        {
            this._SafeStr_22190 = k;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22190 = null;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            if (this._SafeStr_22190)
            {
                this._SafeStr_22190._SafeStr_22075();
            }
            else
            {
                HabboGamesCom.log("Too early for this stuff..");
            }
        }
    }
}
