package org.openvideoads.vast.schedule.ads.templates
{
    import org.openvideoads.vast.model.NonLinearVideoAd;

    public class _Str_5713 extends _Str_3048 
    {
        public function _Str_5713(k:String="flash", _arg_2:String=null)
        {
            super(k, ((_arg_2 != null) ? _arg_2 : null));
        }

        override public function getContent(k:NonLinearVideoAd):String
        {
            if (k != null)
            {
                if (k._Str_3937())
                {
                    return replace(((_Str_2620 == null) ? "_code_" : _Str_2620), "code", k.codeBlock);
                }
                if (k.url != null)
                {
                    return replace("<script type='text/javascript' src='_code_'></script>", "code", k.url.url);
                }
                return "<script type='text/javascript' src=''></script>";
            }
            return "Non-linear video ad not available";
        }
    }
}
