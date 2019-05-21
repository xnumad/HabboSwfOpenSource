package snowwar._Str_39
{
    import snowwar.Tile;
    import snowwar._Str_62._SafeStr_3586;
    import snowwar.SnowWarGameStage;
    import snowwar._Str_62.SnowWarGameObjectData;
    import com.sulake.core.runtime.exceptions.Exception;

    public class _SafeStr_4671 extends _SafeStr_4670 
    {
        private static const _SafeStr_22072:int = 100;

        private var _SafeStr_22073:Array;
        private var _SafeStr_22074:int;

        public function _SafeStr_4671(k:_SafeStr_3586, _arg_2:SnowWarGameStage)
        {
            super(k.id, k._SafeStr_18035, _arg_2.getTileAt(Tile.fromLocationX(k.x), Tile.fromLocationY(k.y)), k._SafeStr_18032);
            this._SafeStr_22074 = k._SafeStr_18034;
            if (_SafeStr_18830 > 0)
            {
                _arg_2.addSnowWarGameObject(this);
            }
            this._SafeStr_22073 = [(_SafeStr_18830 * _SafeStr_22072)];
        }

        override public function get numberOfVariables():int
        {
            return _SafeStr_3586.NUM_OF_VARIABLES;
        }

        override public function getVariable(k:int):int
        {
            switch (k)
            {
                case 0:
                    return SnowWarGameObjectData.OBJECT_TYPE_SNOWBALL_PILE;
                case 1:
                    return _id;
                case 2:
                    return _SafeStr_18809.location.x;
                case 3:
                    return _SafeStr_18809.location.y;
                case 4:
                    return this._SafeStr_22074;
                case 5:
                    return _SafeStr_18830;
                case 6:
                    return _SafeStr_22070;
            }
            throw (new Exception(("No such variable:" + k)));
        }

        override public function get boundingData():Array
        {
            return this._SafeStr_22073;
        }

        override protected function onSnowballPickup():void
        {
            this._SafeStr_22073 = [(_SafeStr_18830 * _SafeStr_22072)];
            if (_SafeStr_18830 <= 0)
            {
                _SafeStr_18809.removeGameObject();
            }
        }

        public function get _SafeStr_18034():int
        {
            return this._SafeStr_22074;
        }
    }
}
