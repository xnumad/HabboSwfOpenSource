package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar.SnowWarEngine;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4693 extends _SafeStr_4020 
    {
        private var _SafeStr_22183:HumanGameObject;
        private var _targetX:int;
        private var _SafeStr_20902:int;
        private var _SafeStr_19035:int;

        public function _SafeStr_4693(k:HumanGameObject, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            this._SafeStr_22183 = k;
            this._targetX = _arg_2;
            this._SafeStr_20902 = _arg_3;
            this._SafeStr_19035 = _arg_4;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22183 = null;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            this._SafeStr_22184._SafeStr_18847(this.targetX, this._SafeStr_16005);
            this._SafeStr_22184._SafeStr_18846();
            SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_THROW);
        }

        public function get _SafeStr_22184():HumanGameObject
        {
            return this._SafeStr_22183;
        }

        public function get targetX():int
        {
            return this._targetX;
        }

        public function get _SafeStr_16005():int
        {
            return this._SafeStr_20902;
        }

        public function get _SafeStr_18038():int
        {
            return this._SafeStr_19035;
        }
    }
}









