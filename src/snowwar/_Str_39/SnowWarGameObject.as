package snowwar._Str_39
{
    import snowwar._Str_231.ISnowWarGameObject;
    import snowwar._Str_254._SafeStr_4030;
    import snowwar._Str_231.SynchronizedGameStage;
    import snowwar._Str_254.Location;
    import snowwar._Str_254.Direction360;
    import snowwar._Str_254.CollisionDetection;
    import snowwar.SnowWarGameStage;

    public class SnowWarGameObject implements ISnowWarGameObject, _SafeStr_4030 
    {
        protected var _active:Boolean = false;
        protected var _id:int = -1;
        protected var _SafeStr_18805:Boolean = false;
        private var _disposed:Boolean = false;

        public function SnowWarGameObject(k:int, _arg_2:Boolean)
        {
            this._id = ((_arg_2) ? -(k) : k);
            this._SafeStr_18805 = _arg_2;
        }

        public function dispose():void
        {
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isActive():Boolean
        {
            return this._active;
        }

        public function set isActive(k:Boolean):void
        {
            this._active = k;
        }

        public function get numberOfVariables():int
        {
            return -1;
        }

        public function getVariable(k:int):int
        {
            return -1;
        }

        public function get _SafeStr_13236():int
        {
            return this._id;
        }

        public function set _SafeStr_13236(k:int):void
        {
            this._id = k;
        }

        public function subturn(k:SynchronizedGameStage):void
        {
        }

        public function get boundingType():int
        {
            return 0;
        }

        public function get boundingData():Array
        {
            return null;
        }

        public function get location3D():Location
        {
            return null;
        }

        public function get direction360():Direction360
        {
            return null;
        }

        public function get _SafeStr_18700():Boolean
        {
            return this._SafeStr_18805;
        }

        public function get _SafeStr_13241():int
        {
            return -(this._id + 1);
        }

        public function onRemove():void
        {
        }

        public function get collisionHeight():int
        {
            return this.boundingData[0];
        }

        public function testSnowBallCollision(k:_SafeStr_4035):Boolean
        {
            return (k.location3D.z < this.collisionHeight) && (CollisionDetection._SafeStr_18806(this, k));
        }

        public function onSnowBallHit(k:SnowWarGameStage, _arg_2:_SafeStr_4035):void
        {
        }
    }
}
