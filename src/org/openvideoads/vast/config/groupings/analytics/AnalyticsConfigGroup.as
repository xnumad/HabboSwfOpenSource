package org.openvideoads.vast.config.groupings.analytics
{
    import org.openvideoads.vast.config.groupings._Str_3389;
    import org.openvideoads.vast.config.groupings.analytics.google.GoogleAnalyticsConfigGroup;
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.util.StringUtils;

    public class AnalyticsConfigGroup extends _Str_3389 
    {
        public static const GA:String = "GA";

        protected var _Str_7840:GoogleAnalyticsConfigGroup;

        public function AnalyticsConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.google != undefined)
                {
                    this.google.initialise(k.google, null, _arg_3);
                }
            }
            _Str_3144();
        }

        override public function isOVAConfigLoading():Boolean
        {
            if (this._Str_7840 != null)
            {
                return (_Str_6229()) && (this._Str_7840._Str_6229());
            }
            return _Str_6229();
        }

        public function update(k:Array):void
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    if (StringUtils._Str_2576(k[_local_2].type, GA))
                    {
                        this.google.update(k[_local_2]);
                    }
                    _local_2++;
                }
            }
        }

        public function _Str_25296():Boolean
        {
            return this.google.enabled;
        }

        public function set google(k:*):void
        {
            if ((k is GoogleAnalyticsConfigGroup))
            {
                this._Str_7840 = k;
            }
            else
            {
                this._Str_7840 = new GoogleAnalyticsConfigGroup(k);
            }
        }

        public function get google():GoogleAnalyticsConfigGroup
        {
            if (this._Str_7840 == null)
            {
                this._Str_7840 = new GoogleAnalyticsConfigGroup();
            }
            return this._Str_7840;
        }
    }
}
