package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar.SnowWarEngine;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4683 extends _SafeStr_4020 
    {
        private var _SafeStr_22183:HumanGameObject;
        private var _SafeStr_22191:HumanGameObject;
        private var _SafeStr_19035:int;

        public function _SafeStr_4683(k:HumanGameObject, _arg_2:HumanGameObject, _arg_3:int)
        {
            this._SafeStr_22183 = k;
            this._SafeStr_22191 = _arg_2;
            this._SafeStr_19035 = _arg_3;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22183 = null;
            this._SafeStr_22191 = null;
            this._SafeStr_19035 = 0;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            this._SafeStr_22184._SafeStr_18847(this._SafeStr_22191.currentLocation.x, this._SafeStr_22191.currentLocation.y);
            this._SafeStr_22184._SafeStr_18846();
            SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_THROW);
        }

        public function get _SafeStr_22184():HumanGameObject
        {
            return this._SafeStr_22183;
        }

        public function get _SafeStr_22192():HumanGameObject
        {
            return this._SafeStr_22191;
        }

        public function get _SafeStr_18038():int
        {
            return this._SafeStr_19035;
        }
    }
}
