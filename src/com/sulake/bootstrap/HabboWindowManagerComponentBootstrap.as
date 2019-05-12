package com.sulake.bootstrap
{
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;

    public class HabboWindowManagerComponentBootstrap extends HabboWindowManagerComponent 
    {
        public function HabboWindowManagerComponentBootstrap(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
			try
			{
				super(k, _arg_2, _arg_3);
			}
			catch (e:Error)
			{
				Habbo.trackLoginStep(e.getStackTrace());
			}
        }
    }
}
