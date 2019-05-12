package snowwar._Str_39
{
    import snowwar.Tile;
    import snowwar._Str_254.Direction360;
    import snowwar._Str_254.CollisionDetection;
    import snowwar._Str_254.Location;
    import snowwar._Str_231.SynchronizedGameStage;
    import snowwar.SnowWarGameStage;

    public class _SafeStr_4670 extends SnowWarGameObject 
    {
        protected var _SafeStr_22070:int;
        protected var _SafeStr_18830:int;
        protected var _SafeStr_18809:Tile;

        public function _SafeStr_4670(k:int, _arg_2:int, _arg_3:Tile, _arg_4:int)
        {
            super(k, false);
            _active = true;
            this._SafeStr_18830 = _arg_2;
            this._SafeStr_18809 = _arg_3;
            this._SafeStr_22070 = _arg_4;
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_18809 = null;
        }

        override public function get direction360():Direction360
        {
            return null;
        }

        override public function get boundingType():int
        {
            return CollisionDetection._SafeStr_18853;
        }

        override public function get location3D():Location
        {
            return this._SafeStr_18809.location;
        }

        public function get _SafeStr_18032():int
        {
            return this._SafeStr_22070;
        }

        public function get _SafeStr_18035():int
        {
            return this._SafeStr_18830;
        }

        override public function subturn(k:SynchronizedGameStage):void
        {
        }

        public function _SafeStr_22071(k:int):int
        {
            if (this._SafeStr_18830 < k)
            {
                k = this._SafeStr_18830;
            }
            this._SafeStr_18830 = (this._SafeStr_18830 - k);
            this.onSnowballPickup();
            return k;
        }

        override public function onSnowBallHit(k:SnowWarGameStage, _arg_2:_SafeStr_4035):void
        {
        }

        protected function onSnowballPickup():void
        {
        }
    }
}
