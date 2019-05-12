package org.openvideoads.vast.server.request.adtech
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.config.CustomProperties;

    public class _Str_9861 extends AdServerConfig 
    {
        public function _Str_9861(k:Object=null)
        {
            this.oneAdPerRequest = true;
            this.forceImpressionServing = true;
            super("AdTech", k);
        }

        override protected function get defaultTemplate():String
        {
            return "__api-address__/__zone__/__nondynamic__;alias=__alias____aliaspostfix__;key=__key__;__key-value__;__cookie-name__=__cookie-value__;grp=__group__;misc=__random-number__";
        }

        override protected function get defaultCustomProperties():CustomProperties
        {
            return (new CustomProperties({
                "nondynamic":"noperf=1;cc=2;header=yes;cookie=yes;adct=204",
                "alias":"",
                "aliaspostfix":"",
                "key":"key1+key2",
                "key-value":"",
                "cookie-name":"",
                "cookie-value":"",
                "group":"[group]"
            }));
        }
    }
}
