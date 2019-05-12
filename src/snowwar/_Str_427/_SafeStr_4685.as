package snowwar._Str_427
{
    import snowwar._Str_39._SafeStr_4035;
    import snowwar._Str_39.HumanGameObject;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4685 extends _SafeStr_4020 
    {
        private var _SafeStr_22193:_SafeStr_4035;
        private var _SafeStr_22183:HumanGameObject;
        private var _SafeStr_20901:int;
        private var _SafeStr_20902:int;
        private var _SafeStr_19035:int;

        public function _SafeStr_4685(k:int, _arg_2:HumanGameObject, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._SafeStr_22193 = new _SafeStr_4035(k);
            this._SafeStr_22183 = _arg_2;
            this._SafeStr_20901 = _arg_3;
            this._SafeStr_20902 = _arg_4;
            this._SafeStr_19035 = _arg_5;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22193 = null;
            this._SafeStr_22183 = null;
        }

        public function set _SafeStr_22194(k:_SafeStr_4035):void
        {
            this._SafeStr_22193 = k;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            k.addActiveGameObject(this._SafeStr_22193._SafeStr_13236, this._SafeStr_22193);
            this._SafeStr_22193.isActive = true;
            var _local_2:int = this._SafeStr_22183.currentLocation.x;
            var _local_3:int = this._SafeStr_22183.currentLocation.y;
            var _local_4:int = _SafeStr_4035._SafeStr_19021;
            this._SafeStr_22193.initialize(_local_2, _local_3, _local_4, this._SafeStr_19035, this._SafeStr_20901, this._SafeStr_20902, this._SafeStr_22183);
        }
    }
}
