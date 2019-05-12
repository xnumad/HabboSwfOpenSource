package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboTrackingBootstrap;
    import com.sulake.iid.IIDHabboTracking;
    import binaryData.*;

    public class HabboTrackingLib extends SimpleApplication 
    {
        public static var manifest:Class = _Str_10456;
        public static var requiredClasses:Array = new Array(HabboTrackingBootstrap, IIDHabboTracking);
    }
}
