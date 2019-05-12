package org.openvideoads.regions.config
{
    public class RegionsConfig extends BaseRegionConfig 
    {
        protected var _Str_21912:Boolean = false;
        protected var _Str_3908:Array;
        protected var _Str_26159:String = null;

        public function RegionsConfig(k:Object=null)
        {
            this._Str_3908 = new Array();
            super(k);
        }

        override public function setup(k:Object):void
        {
            super.setup(k);
            id = "master";
            if (k != null)
            {
                if (k.hasOwnProperty("declarations"))
                {
                    this.regions = k.declarations;
                }
                if (k.closeButton != undefined)
                {
                    closeButton = new CloseButtonConfig(k.closeButton);
                }
            }
        }

        public function hasRegionDefinitions():Boolean
        {
            return this._Str_3908.length > 0;
        }

        public function set _Str_23185(k:Boolean):void
        {
            this._Str_21912 = k;
        }

        public function get _Str_23185():Boolean
        {
            return this._Str_21912;
        }

        public function set regions(k:Array):void
        {
            var _local_2:int;
            var _local_3:RegionViewConfig;
            this._Str_3908 = new Array();
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    _local_3 = new RegionViewConfig(properties);
                    _local_3.setup(k[_local_2]);
                    this._Str_3908.push(_local_3);
                    _local_2++;
                }
            }
        }

        public function get regions():Array
        {
            return this._Str_3908;
        }
    }
}
