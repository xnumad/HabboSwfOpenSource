package org.openvideoads.vast.config.groupings.analytics.google
{
    import org.openvideoads.vast.config.groupings._Str_3389;
    import flash.display.DisplayObject;
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.util.StringUtils;

    public class GoogleAnalyticsConfigGroup extends _Str_3389 
    {
        public static const OVA:String = "OVA";
        public static const CUSTOM:String = "CUSTOM";

        protected var _Str_2699:Boolean = true;
        protected var _Str_10351:GoogleAnalyticsTrackingGroup;
        protected var _Str_4747:GoogleAnalyticsTrackingGroup = null;
        protected var _Str_3875:DisplayObject = null;

        public function GoogleAnalyticsConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_10351 = new GoogleAnalyticsTrackingGroup("OVA", {
                "enable":true,
                "impressions":{"enable":true}
            });
            super(k, _arg_2);
        }

        protected function _Str_20423():void
        {
            if (this._Str_3875 != null)
            {
                this.ova.displayObject = this._Str_3875;
                if (this._Str_4747 != null)
                {
                    this._Str_4747.displayObject = this._Str_3875;
                }
            }
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.enable != undefined)
                {
                    if ((k.enable is String))
                    {
                        this._Str_2699 = (k.enable.toUpperCase() == "TRUE");
                    }
                    else
                    {
                        this._Str_2699 = k.enable;
                    }
                }
                if (k.ova != undefined)
                {
                    this.ova = new GoogleAnalyticsTrackingGroup("OVA", k.ova, _arg_3);
                    if (k.ova.displayObject != null)
                    {
                        this._Str_3875 = k.ova.displayObject;
                    }
                }
                if (k.custom != undefined)
                {
                    if (k.custom.displayObject != null)
                    {
                        this._Str_3875 = k.custom.displayObject;
                    }
                    this.custom = new GoogleAnalyticsTrackingGroup("CUSTOM");
                    this.custom.initialise(k.custom, _arg_3);
                }
                this._Str_20423();
            }
            _Str_3144();
        }

        public function update(k:Object):void
        {
            if (StringUtils._Str_2576(k.element, OVA))
            {
                this.ova.update(k);
            }
            if (StringUtils._Str_2576(k.element, CUSTOM))
            {
                this.custom.update(k);
            }
            if (k.displayObject != null)
            {
                this._Str_3875 = k.displayObject;
            }
            this._Str_20423();
        }

        public function get enabled():Boolean
        {
            if (this._Str_2699 == false)
            {
                return false;
            }
            return (this.ova.trackingEnabled) || (this.custom.trackingEnabled);
        }

        public function set ova(k:GoogleAnalyticsTrackingGroup):void
        {
            this._Str_10351 = k;
        }

        public function get ova():GoogleAnalyticsTrackingGroup
        {
            if (this._Str_10351 == null)
            {
                this._Str_10351 = new GoogleAnalyticsTrackingGroup(OVA);
            }
            return this._Str_10351;
        }

        public function set custom(k:GoogleAnalyticsTrackingGroup):void
        {
            this._Str_4747 = k;
        }

        public function get custom():GoogleAnalyticsTrackingGroup
        {
            if (this._Str_4747 == null)
            {
                this._Str_4747 = new GoogleAnalyticsTrackingGroup(CUSTOM, {"enable":false});
            }
            return this._Str_4747;
        }
    }
}
