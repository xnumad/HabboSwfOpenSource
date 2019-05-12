package com.sulake.bootstrap
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;

    public class HabboCatalogBootstrap extends HabboCatalog 
    {
        public function HabboCatalogBootstrap(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
