package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;

    public class CloseButtonConfig extends Debuggable 
    {
        protected var _Str_4373:Boolean = true;
        protected var _Str_2442:String = "overlay-close-button";
        protected var _Str_19122:Boolean = true;

        public function CloseButtonConfig(k:*=null)
        {
            this.initialise(k);
        }

        public function initialise(k:*):void
        {
            if (k != null)
            {
                if ((k is String))
                {
                    this._Str_4373 = StringUtils._Str_2810(k);
                }
                else
                {
                    if ((k is Boolean))
                    {
                        this._Str_4373 = k;
                    }
                    else
                    {
                        if (k.hasOwnProperty("enable"))
                        {
                            this._Str_4373 = StringUtils._Str_2810(k.enable);
                        }
                        if (k.hasOwnProperty("region"))
                        {
                            this._Str_2442 = k.region;
                        }
                        if (k.hasOwnProperty("program"))
                        {
                            this._Str_19122 = StringUtils._Str_2810(k.program);
                        }
                    }
                }
            }
        }

        public function get enabled():Boolean
        {
            return this._Str_4373;
        }

        public function get region():String
        {
            return this._Str_2442;
        }

        public function get program():Boolean
        {
            return this._Str_19122;
        }
    }
}
