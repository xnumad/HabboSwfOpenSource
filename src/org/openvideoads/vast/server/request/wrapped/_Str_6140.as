package org.openvideoads.vast.server.request.wrapped
{
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.util.NetworkResource;

    public class _Str_6140 extends AdServerRequest 
    {
        protected var _Str_577:String = null;

        public function _Str_6140(k:String, _arg_2:AdServerConfig)
        {
            super(new _Str_10949(_arg_2));
            if (parseWrappedAdTags())
            {
                this._Str_577 = _Str_15243(k);
            }
            else
            {
                this._Str_577 = k;
            }
        }

        override public function isWrapped():Boolean
        {
            return true;
        }

        override public function formRequest(k:Array=null):String
        {
            if (_Str_19077())
            {
                _Str_4164 = NetworkResource._Str_24693(this._Str_577, ("cache-buster=" + Math.random()));
            }
            else
            {
                _Str_4164 = this._Str_577;
            }
            return _Str_4164;
        }
    }
}
