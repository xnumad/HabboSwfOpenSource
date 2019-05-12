package org.openvideoads.vast.schedule.ads.templates
{
    import org.openvideoads.vast.model.NonLinearVideoAd;

    public class _Str_5816 extends _Str_3048 
    {
        public function _Str_5816(k:String="flash", _arg_2:String=null)
        {
            super(k, ((_arg_2 != null) ? _arg_2 : ((k == "html5") ? (this._Str_23474()) : (""))));
        }

        protected function _Str_23474():String
        {
            var k:String = "";
            k = '<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" _dimensions_ id="non-linear-_id_">';
            k = (k + '<param name="movie" value="_url_">');
            k = (k + '<param name="allowScriptAccess" value="always">');
            k = (k + '<param name="FlashVars" value="clickTag=_clickTag_&clickTAG=_clickTag_&clicktag=_clickTag_"/>');
            k = (k + '<embed name="non-linear_id_" src="_url_" _dimensions_ allowScriptAccess="always" allowFullScreen="true"');
            k = (k + ' pluginspage="http://www.macromedia.com/go/getflashplayer"');
            k = (k + ' flashvars="clickTag=_clickTag_&clickTAG=_clickTag_&clicktag=_clickTag_">');
            k = (k + "</embed>");
            k = (k + "</object>");
            return k;
        }

        override public function getContent(k:NonLinearVideoAd):String
        {
            var _local_2:String;
            var _local_3:String;
            if (k != null)
            {
                if (k._Str_3937())
                {
                    return k.codeBlock;
                }
                if (k.url != null)
                {
                    _local_2 = replace(_Str_2620, "url", k.url.url);
                    _local_3 = "";
                    if (((k._Str_17410()) && (k._Str_17902())))
                    {
                        _local_3 = (((('width="' + k.width) + '" height="') + k.height) + '"');
                    }
                    _local_2 = replace(_local_2, "dimensions", _local_3);
                    if (k._Str_5569())
                    {
                        _local_2 = replace(_local_2, "clicktag", k.getClickThroughURLString());
                    }
                    return _local_2;
                }
                return "";
            }
            return "Non-linear video ad not available";
        }
    }
}
