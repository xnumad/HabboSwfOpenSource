package com.sulake.habbo.friendbar.view
{
    import com.sulake.core.runtime.Component;
	import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
	import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboTracking;
    import __AS3__.vec.Vector;

    public class AbstractView extends Component 
    {
        protected var _windowManager:IHabboWindowManager;
        protected var _avatarManager:IAvatarRenderManager;
        protected var _localizationManager:IHabboLocalizationManager;
        protected var _sessionDataManager:ISessionDataManager;
        protected var _tracking:IHabboTracking;
		protected var configurationManager:IHabboConfigurationManager;

        public function AbstractView(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarManager = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), function (k:IHabboConfigurationManager):void
            {
                configurationManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            })]));
        }
    }
}
