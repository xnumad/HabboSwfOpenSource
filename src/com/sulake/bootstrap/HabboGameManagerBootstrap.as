package com.sulake.bootstrap
{
    import com.sulake.habbo.game.HabboGameManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;

    public class HabboGameManagerBootstrap extends HabboGameManager 
    {
        public function HabboGameManagerBootstrap(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
