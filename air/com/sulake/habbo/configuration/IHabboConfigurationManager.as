//com.sulake.habbo.configuration.IHabboConfigurationManager

package com.sulake.habbo.configuration{
    import com.sulake.core.runtime.ICoreConfiguration;

    public /*dynamic*/ interface IHabboConfigurationManager extends ICoreConfiguration {

        function updateEnvironmentId(k:String):void;
        function resetAll():void;
        function initConfigurationDownload():void;

    }
}//package com.sulake.habbo.configuration

