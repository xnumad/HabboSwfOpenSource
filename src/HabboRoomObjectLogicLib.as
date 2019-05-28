package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomObjectFactoryBootstrap;
    import com.sulake.iid.IIDRoomObjectFactory;
    import binaryData.*;

    public class HabboRoomObjectLogicLib extends SimpleApplication 
    {
        public static var manifest:Class = HabboRoomObjectLogicLib_manifest;
        public static var requiredClasses:Array = new Array(RoomObjectFactoryBootstrap, IIDRoomObjectFactory);
    }
}
