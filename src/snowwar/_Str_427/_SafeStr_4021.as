package snowwar._Str_427
{
    import snowwar._Str_39.HumanGameObject;
    import snowwar._Str_231.SynchronizedGameStage;

    public class _SafeStr_4021 extends _SafeStr_4020 
    {
        private var _SafeStr_18601:HumanGameObject;
        private var _SafeStr_6268:int;
        private var _SafeStr_6269:int;

        public function _SafeStr_4021(k:HumanGameObject, _arg_2:int, _arg_3:int)
        {
            this._SafeStr_18601 = k;
            this._SafeStr_6268 = _arg_2;
            this._SafeStr_6269 = _arg_3;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_18601 = null;
        }

        override public function apply(k:SynchronizedGameStage):void
        {
            this._SafeStr_18601._SafeStr_18603(this._SafeStr_6268, this._SafeStr_6269);
        }

        public function get _SafeStr_18602():HumanGameObject
        {
            return this._SafeStr_18601;
        }

        public function get x():int
        {
            return this._SafeStr_6268;
        }

        public function get y():int
        {
            return this._SafeStr_6269;
        }
    }
}
