package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboTrackingBootstrap;
    import com.sulake.iid.IIDHabboTracking;
    import binaryData.*;

    public class HabboTrackingLib extends SimpleApplication 
    {
        public static var manifest:Class = HabboTrackingLib_manifest;
        public static var requiredClasses:Array = new Array(HabboTrackingBootstrap, IIDHabboTracking);
    }
}
