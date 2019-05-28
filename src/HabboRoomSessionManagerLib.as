package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomSessionManagerBootstrap;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import binaryData.*;

    public class HabboRoomSessionManagerLib extends SimpleApplication 
    {
        public static var manifest:Class = HabboRoomSessionManagerLib_manifest;
        public static var requiredClasses:Array = new Array(RoomSessionManagerBootstrap, IIDHabboRoomSessionManager);
    }
}
