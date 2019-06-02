package org.openvideoads.vast.model
{
    public class _Str_5606 extends NonLinearVideoAd 
    {


        public function get imageURL():String
        {
            if (_Str_3366 != null)
            {
                return _Str_3366;
            }
            if (_Str_4309())
            {
                return _Str_577.getQualifiedStreamAddress();
            }
            return "";
        }

        override public function get content():String
        {
            return this.imageURL;
        }
    }
}
