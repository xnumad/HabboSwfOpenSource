package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboConfigurationManagerBootstrap;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.habbo.configuration.HabboConfigurationManager;
    import binaryData.*;

    public class HabboConfigurationCom extends SimpleApplication 
    {
        public static var requiredClasses:Array = new Array(HabboConfigurationManagerBootstrap, IIDHabboConfigurationManager, HabboConfigurationManager);
        public static var manifest:Class = _Str_14563;
        public static var localization_configuration:Class = _Str_13614;
    }
}
