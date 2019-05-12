package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.SessionDataManagerBootstrap;
    import com.sulake.iid.IIDSessionDataManager;
    import binaryData.*;
    import images.*;

    public class HabboSessionDataManagerLib extends SimpleApplication 
    {
        public static var requiredClasses:Array = new Array(SessionDataManagerBootstrap, IIDSessionDataManager);
        public static var manifest:Class = _Str_13276;
        public static var loading_icon:Class = _Str_15736;
    }
}
