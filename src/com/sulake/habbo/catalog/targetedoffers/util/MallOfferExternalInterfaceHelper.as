package com.sulake.habbo.catalog.targetedoffers.util
{
    import com.sulake.habbo.catalog.targetedoffers.OfferController;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;

    public class MallOfferExternalInterfaceHelper 
    {
        private static const TARGETEDWEBOFFER_CHECKOFFER:String = "TargetedWebOffer.checkOffer";
        private static const TARGETEDWEBOFFERCHECKFAILED:String = "targetedWebOfferCheckFailed";
        private static const TARGETEDWEBOFFERCHECKRESPONSE:String = "targetedWebOfferCheckResponse";

        private var _controller:OfferController;

        public function MallOfferExternalInterfaceHelper(k:OfferController)
        {
            this._controller = k;
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(TARGETEDWEBOFFERCHECKRESPONSE, this._Str_23541);
                ExternalInterface.addCallback(TARGETEDWEBOFFERCHECKFAILED, this._Str_23241);
                ExternalInterface.call(TARGETEDWEBOFFER_CHECKOFFER);
            }
            else
            {
                return;
            }
        }

        public function dispose():void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(TARGETEDWEBOFFERCHECKRESPONSE, null);
                ExternalInterface.addCallback(TARGETEDWEBOFFERCHECKFAILED, null);
            }
            this._controller = null;
        }

        public function _Str_23541(k:Object):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:HabboMallOffer = new HabboMallOffer(k);
            if (!_local_2)
            {
                return;
            }
            this._controller._Str_22982(_local_2);
        }

        public function _Str_23241():void
        {
        }
    }
}
