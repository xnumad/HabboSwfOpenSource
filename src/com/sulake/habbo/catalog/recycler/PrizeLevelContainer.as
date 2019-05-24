package com.sulake.habbo.catalog.recycler
{
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_7352;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_8691;
    import com.sulake.habbo.catalog.HabboCatalog;

    public class PrizeLevelContainer 
    {
        private var _Str_6714:int;
        private var _prizes:Array;

        public function PrizeLevelContainer(k:_Str_8691, _arg_2:HabboCatalog)
        {
            var _local_4:_Str_7352;
            var _local_5:_Str_3903;
            var _local_6:IFurnitureData;
            super();
            this._Str_6714 = k._Str_16418;
            _arg_2.localization.registerParameter(("recycler.prizes.odds." + this._Str_6714), "odds", ("1:" + k._Str_24405));
            this._prizes = new Array();
            var _local_3:int;
            while (_local_3 < k.prizes.length)
            {
                _local_4 = k.prizes[_local_3];
                if (_local_4._Str_19070)
                {
                    _local_5 = new DealPrizeContainer(_local_4._Str_9475, this._Str_6714, _arg_2);
                }
                else
                {
                    _local_6 = _arg_2.getFurnitureData(_local_4._Str_6270, _local_4._Str_7585);
                    _local_5 = new _Str_3903(_local_4._Str_7585, _local_4._Str_6270, _local_6, this._Str_6714, _arg_2);
                }
                this._prizes.push(_local_5);
                _local_3++;
            }
        }

        public function get _Str_16418():int
        {
            return this._Str_6714;
        }

        public function get prizes():Array
        {
            return this._prizes;
        }
    }
}
