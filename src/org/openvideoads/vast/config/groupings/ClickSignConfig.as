package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.regions.config.CloseButtonConfig;

    public class ClickSignConfig extends RegionViewConfig 
    {
        protected var _Str_2699:Boolean = true;
        protected var _Str_2529:String = "_blank";

        public function ClickSignConfig(k:Object=null)
        {
            super(null);
            _id = "reserved-click-me-prompt";
            _Str_7287 = "CENTER";
            _Str_12474 = "CENTER";
            _width = 250;
            _height = 32;
            _Str_11028 = 0.5;
            _Str_10333 = 20;
            _backgroundColor = "#000000";
            _Str_616 = ".smalltext { font-size:12; }";
            _Str_4544 = '<p class="smalltext" align="center">CLICK FOR MORE INFORMATION</p>';
            _Str_12703 = 0.75;
            _Str_2728 = new org.openvideoads.regions.config.CloseButtonConfig({"enabled":false});
            setup(k);
            if (k != null)
            {
                if (k.closeButton != undefined)
                {
                    if ((k.closeButton is org.openvideoads.regions.config.CloseButtonConfig))
                    {
                        _Str_2728 = k.closeButton;
                    }
                    else
                    {
                        _Str_2728 = new org.openvideoads.regions.config.CloseButtonConfig(k.closeButton);
                    }
                }
                if (k.enabled != undefined)
                {
                    if ((k.enabled is String))
                    {
                        this.enabled = ((k.enabled.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enabled = k.enabled;
                    }
                }
                if (k.target != undefined)
                {
                    this._Str_2529 = k.target;
                }
            }
        }

        public function set enabled(k:Boolean):void
        {
            this._Str_2699 = k;
        }

        public function get enabled():Boolean
        {
            return this._Str_2699;
        }

        public function set target(k:String):void
        {
            this._Str_2529 = k;
        }

        public function get target():String
        {
            return this._Str_2529;
        }
    }
}
