package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar._Str_39._SafeStr_4670;
    import snowwar.SnowWarEngine;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4684 extends _SafeStr_4020 
    {
        private var _SafeStr_22183:HumanGameObject;
        private var _SafeStr_22190:_SafeStr_4670;

        public function _SafeStr_4684(k:HumanGameObject, _arg_2:_SafeStr_4670)
        {
            this._SafeStr_22183 = k;
            this._SafeStr_22190 = _arg_2;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22183 = null;
            this._SafeStr_22190 = null;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            var _local_3:int;
            var _local_4:HumanGameObject;
            var _local_2:int = this._SafeStr_22183._SafeStr_18850();
            if (_local_2 > 0)
            {
                _local_3 = this._SafeStr_22190._SafeStr_22071(1);
                if (_local_3 > 0)
                {
                    this._SafeStr_22183._SafeStr_18851(_local_3);
                    _local_4 = (k.getGameObject(this._SafeStr_22183._SafeStr_13241) as HumanGameObject);
                    if (_local_4)
                    {
                        _local_4._SafeStr_18851(_local_3);
                    }
                    SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_GET_SNOWBALL);
                }
            }
        }

        public function get _SafeStr_22184():HumanGameObject
        {
            return this._SafeStr_22183;
        }
    }
}
