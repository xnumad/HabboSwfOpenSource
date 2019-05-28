package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.AdManagerBootstrap;
    import com.sulake.iid.IIDHabboAdManager;
    import binaryData.*;

    public class HabboAdManagerCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboAdManagerCom_manifest;
        public static var requiredClasses:Array = new Array(AdManagerBootstrap, IIDHabboAdManager);
    }
}
