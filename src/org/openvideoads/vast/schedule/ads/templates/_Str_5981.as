package org.openvideoads.vast.schedule.ads.templates
{
    import org.openvideoads.vast.model.NonLinearVideoAd;

    public class _Str_5981 extends _Str_3048 
    {
        public function _Str_5981(k:String="flash", _arg_2:String=null)
        {
            super(k);
            _Str_2620 = ((_arg_2 != null) ? _arg_2 : null);
        }

        protected function _Str_24615(k:String, _arg_2:Number, _arg_3:Number):String
        {
            var _local_4:String;
            if (((_arg_2 > -1) && (_arg_3 > -1)))
            {
                _local_4 = replace(((_Str_2620 == null) ? "<iframe src='_code_' hspace=0 vspace=0 frameborder=0 marginheight=0 marginwidth=0 scrolling=no width=_width_ height=_height_><p>Your browser does not support iframes.</p></iframe>" : _Str_2620), "code", k);
                _local_4 = replace(_local_4, "width", _arg_2.toString());
                _local_4 = replace(_local_4, "height", _arg_3.toString());
            }
            else
            {
                _local_4 = replace(((_Str_2620 == null) ? "<iframe src='_code_' hspace=0 vspace=0 frameborder=0 marginheight=0 marginwidth=0 scrolling=no><p>Your browser does not support iframes.</p></iframe>" : _Str_2620), "code", k);
            }
            return _local_4;
        }

        override public function getContent(k:NonLinearVideoAd):String
        {
            if (k != null)
            {
                if (k._Str_3937())
                {
                    return k.codeBlock;
                }
                if (k.url != null)
                {
                    return this._Str_24615(k.url.url, k.width, k.height);
                }
                return "";
            }
            return "Non-linear video ad not available";
        }
    }
}
