package snowwar._Str_254
{
    import snowwar._Str_231._SafeStr_4028;

    public class _SafeStr_4023 implements _SafeStr_4022 
    {
        private var _SafeStr_18669:int = -1;
        private var _SafeStr_18670:Direction8;
        private var _SafeStr_18671:_SafeStr_4022;
        private var _SafeStr_18672:int;
        private var _SafeStr_18673:int;
        private var _disposed:Boolean = false;

        public function dispose():void
        {
            this._SafeStr_18670 = null;
            this._SafeStr_18671 = null;
            this._SafeStr_18672 = 0;
            this._SafeStr_18673 = 0;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _SafeStr_18665():Direction8
        {
            return this._SafeStr_18670;
        }

        public function set _SafeStr_18665(k:Direction8):void
        {
            this._SafeStr_18670 = k;
        }

        public function get _SafeStr_18666():_SafeStr_4022
        {
            return this._SafeStr_18671;
        }

        public function set _SafeStr_18666(k:_SafeStr_4022):void
        {
            this._SafeStr_18671 = k;
        }

        public function get _SafeStr_18668():int
        {
            return this._SafeStr_18672;
        }

        public function set _SafeStr_18668(k:int):void
        {
            this._SafeStr_18672 = k;
        }

        public function get _SafeStr_18667():int
        {
            return this._SafeStr_18673;
        }

        public function set _SafeStr_18667(k:int):void
        {
            this._SafeStr_18673 = k;
        }

        public function _SafeStr_8395(k:_SafeStr_4023):int
        {
            var _local_2:int = (this._SafeStr_18673 + this._SafeStr_18672);
            var _local_3:int = (k._SafeStr_18673 + k._SafeStr_18672);
            if (_local_2 < _local_3)
            {
                return -1;
            }
            if (_local_2 > _local_3)
            {
                return 1;
            }
            return 0;
        }

        public function distanceTo(k:_SafeStr_4022):int
        {
            return 0;
        }

        public function directionTo(k:_SafeStr_4022):Direction8
        {
            return null;
        }

        public function getNodeAt(direction:Direction8):_SafeStr_4022
        {
            return null;
        }

        public function directionIsBlocked(direction:Direction8, _arg_2:_SafeStr_4028):Boolean
        {
            return false;
        }

        public function getPathCost(direction:Direction8, _arg_2:_SafeStr_4028):int
        {
            return 0;
        }
    }
}
