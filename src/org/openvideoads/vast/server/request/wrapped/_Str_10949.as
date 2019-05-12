package org.openvideoads.vast.server.request.wrapped
{
    import org.openvideoads.vast.server.config.AdServerConfig;

    public class _Str_10949 extends AdServerConfig 
    {
        public function _Str_10949(k:AdServerConfig)
        {
            super("Wrapped Ad Server", k);
            if (k != null)
            {
                _Str_9744 = k.addCacheBuster;
            }
        }
    }
}
