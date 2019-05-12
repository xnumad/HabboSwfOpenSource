package org.openvideoads.vast.server.request
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.schedule.ads.AdSlot;

    public class AdServerRequestGroup extends Debuggable 
    {
        protected var _Str_5295:String = null;
        protected var _Str_7775:Boolean = false;
        protected var _Str_2407:Array;

        public function AdServerRequestGroup(k:String, _arg_2:Boolean=false)
        {
            this._Str_2407 = new Array();
            super();
            this._Str_5295 = k;
            this._Str_7775 = _arg_2;
        }

        public function get oneAdPerRequest():Boolean
        {
            return this._Str_7775;
        }

        public function addAdSlot(k:AdSlot):void
        {
            this._Str_2407.push(k);
        }

        public function get serverType():String
        {
            return this._Str_5295;
        }

        public function set serverType(k:String):void
        {
            this._Str_5295 = k;
        }

        public function getAdServerRequests():Array
        {
            var _local_2:AdServerRequest;
            var _local_3:int;
            var k:Array = new Array();
            if (this._Str_2407.length > 0)
            {
                _local_3 = 0;
                while (_local_3 < this._Str_2407.length)
                {
                    _local_2 = AdServerRequestType.create(this._Str_2407[_local_3].adServerConfig.serverType);
                    _local_2.config = this._Str_2407[_local_3].adServerConfig;
                    _local_2._Str_19604(this._Str_2407[_local_3].adSlotID, this._Str_2407[_local_3].zone, this._Str_2407[_local_3].slotType);
                    k.push(_local_2);
                    _local_3++;
                }
            }
            return k;
        }

        public function getSingleAdServerRequest():AdServerRequest
        {
            var k:AdServerRequest;
            var _local_2:int;
            if (this._Str_2407.length > 0)
            {
                if (this._Str_2407[0].adServerConfig.serverType != null)
                {
                    k = AdServerRequestType.create(this._Str_2407[0].adServerConfig.serverType);
                    k.config = this._Str_2407[0].adServerConfig;
                    if (k != null)
                    {
                        _local_2 = 0;
                        while (_local_2 < this._Str_2407.length)
                        {
                            k._Str_19604(this._Str_2407[_local_2].adSlotID, this._Str_2407[_local_2].zone, this._Str_2407[_local_2].slotType);
                            _local_2++;
                        }
                        return k;
                    }
                }
            }
            return null;
        }
    }
}
